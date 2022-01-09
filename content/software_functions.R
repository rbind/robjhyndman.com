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
    out <- paste0(out, "<tr>")
    out <- paste0(out, "<td><a href='",z$url[i],"'><img src='",z$hex[i],"' width='70px' style='vertical-align:middle'></a></td>")
    out <- paste0(out, "<td width='60%'>",z$title[i],".</td>")
    if(!is.na(z$github_url[i]))
      out <- paste0(out, "<td><a href=",z$github_url[i]," class='badge badge-small badge-green'>Github</a></td>")
    else
      out <- paste0(out, "<td></td>")
    if(!is.na(z$cran_url[i]))
      out <- paste0(out, "<td><a href=",z$cran_url[i]," class='badge badge-small badge-blue'>CRAN</a></td>")
    else
      out <- paste0(out, "<td></td>")
    if(!is.na(z$downloads[i])) {
      out <- paste0(out, "<td>Monthly downloads:<br>", round(z$downloads[i]), "</td>")
    } else
      out <- paste0(out, "<td></td>")
    out <- paste0(out, "</tr>")
  }
  out <- paste0(out, "</table>")
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

add_section <- function(packages, section_name, include) {
  out <- packages %>%
    filter(!(package %in% include))
  inc <- packages %>%
    filter(package %in% include) %>%
    mutate(section = section_name)
  inc <- inc[match(include, inc$package),]
  bind_rows(out, inc)
}
