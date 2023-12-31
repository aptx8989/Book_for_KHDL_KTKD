skip_if_bs4_book_deps_missing <- function() {
  lapply(bs4_book_deps(), skip_if_not_installed)
  invisible(TRUE)
}

local_bs4_book <- function(name = "book",
                           title = "Awesome Cookbook",
                           author = "Yoda",
                           output_options = NULL,
                           description = NULL,
                           url = NULL,
                           verbose = FALSE,
                           env = parent.frame()) {

  # don't run test using this book skeleton when Pandoc is not available
  skip_if_not_pandoc('2.0')

  path <- local_book(name = name, title = title, author = author,
    description = description, url = url, verbose = verbose, env = env)

  .render_book_quiet(
    path,
    output_format = "bookdown::bs4_book",
    output_options = output_options,
  )

  return(path)
}

get_meta_content <- function(node) {
  xml2::xml_attr(node, "content")
}
