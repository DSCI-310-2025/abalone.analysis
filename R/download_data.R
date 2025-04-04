#' Download and unpack the abalone data from the internet
#'
#' @param url The URL of the dataset to unpack
#'
#' @returns An unpacked data file with the abalone metadata attached
#' @export
#'
#' @examples
#' abalone_data <- download_data("https://archive.ics.uci.edu/static/public/1/abalone.zip")
download_data <- function(url = "url to the abalone dataset") {
  temp <- base::tempfile()
  zipped <- utils::download.file(url, destfile = temp)
  file <- base::unz(temp, "abalone.data")
  data_file <- readr::read_csv(file, col_names = c("sex",
                                                   "length",
                                                   "diameter",
                                                   "height",
                                                   "whole_weight",
                                                   "shucked_weight",
                                                   "viscera_weight",
                                                   "shell_weight",
                                                   "rings"))
  base::unlink(temp)
  return(data_file)

}
