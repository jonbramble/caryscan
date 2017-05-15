#' import data from csv file
#'
#' This function imports the data from spectroscopy measurements
#'
#' @param path path to data source
#' @param skip remove header lines
#' @param nlines number of scan points
#' @param scans number of scans
#' @return data.frame containing data labled R1..RN where N is the number of scans
#' @export

import_data <- function(path,skip=2,nlines=121,scans=15) {
  data_import <- readr::read_csv(path,col_names = FALSE,skip=skip,n_max=nlines)
  keep_names <- c('X1',paste('X',seq(2,2*scans,2),sep=''))
  data_subset <- subset(data_import, select=keep_names)
  colnames(data_subset) <- c('Wavelength',paste('R',seq(1,scans),sep=''))
  data_subset[,'fluo_mean'] <- rowMeans(data_subset[,2:scans+1])
  return(data_subset)
}
