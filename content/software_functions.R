# Return CRAN packages with Hyndman as author
rjh_cran_packages <- function() {
  pkgsearch::ps("Hyndman", size = 100) %>%
    filter(purrr::map_lgl(
      package_data, ~ grepl("Hyndman", .x$Author, fixed = TRUE)
    )) %>%
    select(package) %>%
    mutate(on_cran = TRUE)
}
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

package_table <- function(packages, include) {
  z <- packages[match(include, packages$package),]
  out <- "<table>"
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
    out <- paste(out, "<td width='66%'>",z$title[i],".</td>")
    if(z$on_cran[i])
      out <- paste(out, "<td><a href=",z$cran_url[i],">CRAN</a></td>")
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

add_reference <- function(packages, pkg, pub, cite) {
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
