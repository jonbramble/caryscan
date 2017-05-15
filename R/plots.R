#' plot all the data
#'
#' This function prepares a plot of all the spectroscopy data
#'
#' @param df dataframe of spectroscopy data imported using caryscan package
#' @param scans number of spectra
#' @return plot
#' @export

plot_all <- function(df,scans=15){
  graphics::matplot(df[,'Wavelength'],df[,2:scans+1],type=c("l"),xlab="Wavelength (nm)",ylab="Intensity (a.u)")
}

#' plot the averaged data
#'
#' This function prepares a plot of the averaged spectroscopy data
#'
#' @param df dataframe of spectroscopy data imported using caryscan package
#' @param mean_name the name of the column containing the averaged data
#' @return plot
#' @export

plot_mean <- function(df, mean_name){
  graphics::matplot(df[,'Wavelength'],df[,mean_name],type=c("l"),xlab="Wavelength (nm)",ylab="Intensity (a.u)")
}

#' ggplot all the data
#'
#' This function prepares a ggplot2 plot of all the spectroscopy data
#'
#' @param df dataframe of spectroscopy data imported using caryscan package
#' @param mean_name the name of the column containing the averaged data
#' @return ggplot2 plot object
#' @export
plot_all_gg <- function(df,mean_name='fluo_mean'){
  mdat<-melt_data(df)
  p <- ggplot2::ggplot(subset(mdat,Scan!='fluo_mean'),ggplot2::aes(x=Wavelength,y=Em,group=Scan,color=Scan)) + ggplot2::geom_line() + ggplot2::theme_minimal() + ggplot2::xlab('Emission Wavelength (nm)') + ggplot2::ylab('Intensity (a.u)')
}

#' ggplot the averaged data
#'
#' This function prepares a ggplot2 plot of the averaged spectroscopy data
#'
#' @param df dataframe of spectroscopy data imported using caryscan package
#' @param mean_name the name of the column containing the averaged data
#' @return ggplot2 plot object
#' @export
plot_mean_gg <- function(df,mean_name='fluo_mean'){
  p <- ggplot2::ggplot(dat,ggplot2::aes(x=Wavelength,y=fluo_mean)) + ggplot2::geom_line() + ggplot2::theme_minimal() + ggplot2::xlab('Emission Wavelength (nm)') + ggplot2::ylab('Intensity (a.u)')
}




