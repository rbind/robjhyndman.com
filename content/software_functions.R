# Return CRAN packages with Hyndman as author
rjh_cran_packages <- function() {
  pkgsearch::ps("Hyndman", size = 100) %>%
    filter(purrr::map_lgl(
      package_data, ~ grepl("Hyndman", .x$Author, fixed = TRUE)
    )) %>%
    select(package) %>%
    mutate(on_cran = TRUE)
}
# Get meta data for vector of package names
get_meta <- function(packages, cran=TRUE) {
  get_meta_fn <- ifelse(cran, pkgsearch::cran_package, packageDescription)
  #description <-
  title <- url <- rep(NA_character_, NROW(packages))
  for(i in seq_along(packages$package)) {
    meta <- get_meta_fn(packages$package[i])
    title[i] <- meta$Title
    #description[i] <- meta$Description
    if(!is.null(meta$URL))
      url[i] <- (str_split(meta$URL,",") %>% unlist())[1]
  }
  tibble(package=packages$package, url=url, title=title)
}

# Create generic hex stickers for vector of package names
generic_stickers <- function(packages) {
  # Check if the stickers already exist
  existing <- fs::dir_ls(here::here(paste0("static/img/")), glob = "*.png") %>%
    str_split("/") %>%
    lapply(tail, n=1) %>%
    unlist() %>%
    str_split("\\.") %>%
    lapply(head, n=1) %>%
    unlist()
  packages <- packages[!(packages %in% existing)]
  for(name in packages)
    create_generic_sticker(name)
}

# Create a generic hex stick
create_generic_sticker <- function(name) {
  empty <- ggplot() +
    theme_void() +
    ggimage::theme_transparent()
  name_length <- nchar(name)
  p_size = ifelse(name_length < 8, 24, round(24 - (1.1*name_length-8)))
  hexSticker::sticker(empty,
          package = name,
          p_size = p_size,
          p_y = 1,
          h_fill = "#536878",
          h_size = 2,
          h_color = "#647e91",
          filename=here::here(paste0("static/img/",name,".png"))
  )
}

# Produce html table with info about some packages
# packages is a tibble with all packages
# include is a character vector saying which packages to include and in which order

package_table <- function(packages) {
  z <- packages
  out <- paste("##", z$section[1],"\n\n")
  out <- paste(out, "<table>")
  for(i in seq(NROW(z))) {
    # Create title with extras
    if(!is.na(z$publication[i])) {
      z$title[i] <- paste0(z$title[i], ": as described in <a href='/publications/", z$publication[i], "'>",
                           z$citation[i],"</a>")
    }
    if(!is.na(z$publication2[i])) {
      z$title[i] <- paste0(z$title[i], " and <a href='/publications/", z$publication2[i], "'>",
                           z$citation2[i],"</a>")
    }
    out <- paste(out, "<tr>")
    out <- paste(out, "<td><a href='",z$url[i],"'><img src='",z$hex[i],"' width='70px' style='vertical-align:middle'></a></td>")
    out <- paste0(out, "<td width='60%'>",z$title[i],".</td>")
    if(is.na(z$github[i]))
      out <- paste(out, "<td></td>")
    else
      out <- paste(out, "<td><a href=",z$github_url[i]," class='badge badge-small badge-green'>Github</a></td>")
    if(z$on_cran[i])
      out <- paste(out, "<td><a href=",z$cran_url[i]," class='badge badge-small badge-blue'>CRAN</a></td>")
    else
      out <- paste(out, "<td></td>")
    if(!is.na(z$count[i])) {
      out <- paste(out, "<td>Monthly downloads:<br>", round(z$count[i]), "</td>")
    } else
      out <- paste(out, "<td></td>")
    out <- paste(out, "</tr>")
  }
  out <- paste(out, "</table>")
  cat(out)
}

# Add reference info to packages tibble

add_reference <- function(packages, pkg, pub, cite) {
  tmp <- filter(packages, package == pkg)
  if(NROW(tmp) == 0) {
    packages <- packages %>%
      bind_rows(tibble(package = pkg))
  }
  pub1 <- packages %>%
    filter(package == pkg) %>%
    pull(publication) %>%
    is.na()
  pub2 <- packages %>%
    filter(package == pkg) %>%
    pull(publication2) %>%
    is.na()
  if(!pub1 & !pub2)
    stop("Is this a 3rd publication?")
  if(pub1) {
    packages %>%
      mutate(
        publication = if_else(package==pkg, pub, publication),
        citation = if_else(package==pkg, cite, citation)
      )
  } else {
    packages %>%
      mutate(
        publication2 = if_else(package==pkg, pub, publication2),
        citation2 = if_else(package==pkg, cite, citation2)
      )
  }
}

get_rjh_packages <- function(github, hex, references, extended_titles) {
  # Check if this has been run in last day
  recent_run <- fs::file_exists(here::here("static/files/packages.rds"))
  if(recent_run) {
    info <- fs::file_info(here::here("static/files/packages.rds"))
    recent_run <- (Sys.Date() == anytime::anydate(info$modification_time))
  }
  if(recent_run)
    return(readRDS(here::here("static/files/packages.rds")))

  packages <- tibble(github = github) %>%
    # Extract packages from github repos
    mutate(
      package = stringr::str_extract(github,"/[a-zA-Z0-9\\-]*"),
      package = stringr::str_remove(package,"/"),
      package = stringr::str_extract(package,"[a-zA-Z0-9]*"),
      package = if_else(package=="sfar", "Rsfar", package)
    ) %>%
    # Add in CRAN packages
    full_join(rjh_cran_packages(), by="package") %>%
    replace_na(list(on_cran = FALSE)) %>%
    # Add location of hex stickers
    left_join(hex, by = "package")

  # Create generic hex stickers where they don't exist
  packages %>%
    filter(is.na(hex)) %>%
    pull(package) %>%
    generic_stickers()
  packages <- packages %>%
    mutate(hex = if_else(!is.na(hex), hex, paste0("/img/",package,".png")))

  # Compute average monthly download counts using last 3 complete months
  downloads <- packages %>%
    filter(on_cran) %>%
    pull(package) %>%
    cranlogs::cran_downloads(from = lubridate::ymd(Sys.Date() - 125), to = Sys.Date()) %>%
    as_tibble() %>%
    mutate(month = tsibble::yearmonth(date)) %>%
    group_by(month, package) %>%
    summarise(count = sum(count), .groups = "keep") %>%
    filter(
      month != tsibble::yearmonth(Sys.Date()) &
      month >= tsibble::yearmonth(Sys.Date())-3
    ) %>%
    group_by(package) %>%
    summarise(count = mean(count))

  # CRAN package meta data
  cran_meta <- packages %>%
    filter(on_cran) %>%
    get_meta(cran=TRUE)

  # Github package meta data (need to install packages)
  packages %>%
    filter(!on_cran) %>%
    pull(github) %>%
    remotes::install_github()
  github_meta <- packages %>%
    filter(!on_cran) %>%
    get_meta(cran=FALSE)

  # Add downloads and titles to packages
  packages <- packages %>%
    left_join(downloads, by="package") %>%
    left_join(
      bind_rows(cran_meta, github_meta),
      by="package"
    )

  # Add URLs
  packages <- packages %>%
    mutate(
      github_url = if_else(is.na(github), NA_character_,
                           paste0("https://github.com/",github)),
      cran_url = if_else(!on_cran, NA_character_,
                         paste0("https://cloud.r-project.org/package=",package)),
      url = if_else(!is.na(url), url,
                    if_else(!is.na(github), github_url, cran_url))
    )
  # Add links to related papers
  packages <- left_join(packages, references)

  # Add improved titles
  packages <- packages %>%
    left_join(extended_titles, by='package') %>%
    mutate(title = if_else(is.na(alt_title), title, alt_title))

  # Save result and return it
  saveRDS(packages, file=here::here("static/files/packages.rds"))
  return(packages)
}

add_section <- function(packages, section_name, include) {
  out <- packages %>%
    filter(!(package %in% include))
  inc <- packages %>%
    filter(package %in% include) %>%
    mutate(section = section_name)
  inc <- inc[match(include, inc$package),]
  bind_rows(out, inc)
}
