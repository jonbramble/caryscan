import_data <- function(path,skip=2,n_max=121,scans=15) {
  data_import <- readr::read_csv(path,col_names = FALSE,skip=skip,n_max=n_max)
  keep_names <- c('X1',paste('X',seq(2,2*scans,2),sep=''))
  data_subset <- subset(data_import, select=keep_names)
  colnames(data_subset) <- c('Wavelength',paste('R',seq(1,scans),sep=''))
  data_subset[,'fluo_mean'] <- rowMeans(data_subset[,2:scans+1])
  return(data_subset)
}
