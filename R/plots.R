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
#' @return ggplot2 plot object
#' @export
plot_all_gg <- function(df,scans=15){
  cols <- c('Wavelength',paste('R',seq(1,scans),sep=''))
  subs <- df[,cols]
  mdat <- reshape2::melt(subs,id=c('Wavelength'),variable.name = 'Scan', value.name = 'Em')
  p <- ggplot2::ggplot(mdat,ggplot2::aes(x=Wavelength,y=Em,group=Scan,color=Scan)) + ggplot2::geom_line() + ggplot2::theme_minimal() + ggplot2::xlab('Emission Wavelength (nm)') + ggplot2::ylab('Intensity (a.u)')
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
  p <- ggplot2::ggplot(df,ggplot2::aes_string(x='Wavelength',y=mean_name)) + ggplot2::geom_line() + ggplot2::theme_minimal() + ggplot2::xlab('Emission Wavelength (nm)') + ggplot2::ylab('Intensity (a.u)')
}

#' ggplot the fits data
#'
#' This function prepares a ggplot2 plot of the fits
#'
#' @param df dataframe of spectroscopy data imported using caryscan package
#' @param fit_data dataframe of fits for each peak
#' @param limits vector of wavelength range for plotting
#' @return ggplot2 plot object
#' @export
plot_fits_gg <- function(df,fit_data,limits = c(275,400)){
  fmdat <- reshape2::melt(fit_data,id=c('Wavelength'),variable.name="fit_label",value.name="Em")
  pdat<-subset(fmdat,fit_label==c('fit_a','fit_b','sum_fits'))
  ggplot2::ggplot(pdat,ggplot2::aes(x=Wavelength,y=Em,group=fit_label,colour=fit_label)) +
    ggplot2::geom_line() +
    ggplot2::geom_point(data=df,ggplot2::aes(x=Wavelength,y=fluo_mean),shape=1,inherit.aes=FALSE) +
    ggplot2::theme_minimal() +
    ggplot2::xlab('Emission Wavelength (nm)') +
    ggplot2::ylab('Intentsity (a.u)') +
    ggplot2::scale_colour_discrete(guide = FALSE) +
    ggplot2::scale_x_continuous(breaks = seq(275, 400, 25), limits = limits)
}

#' ggplot the residuals data
#'
#' This function prepares a ggplot2 plot of the residuals from the fits
#'
#' @param df dataframe of spectroscopy data imported using caryscan package
#' @param fit_data dataframe of fits for each peak
#' @param limits vector of wavelength range for plotting
#' @return ggplot2 plot object
#' @export

plot_residuals_gg <- function(fit_data,colname='residuals'){
  res  <- subset(fit_data,Wavelength>280)
  ggplot2::ggplot(res,ggplot2::aes_string(x='Wavelength',y=colname)) +
    ggplot2::geom_line() +
    ggplot2::theme_minimal() +
    ggplot2::xlab('') +
    ggplot2::ylab('residuals') +
    ggplot2::scale_y_continuous(limits = c(-5,5)) +
    ggplot2::scale_x_continuous(breaks = seq(275, 400, 25), limits = c(275,400))
}

#' ggplot the main and residuals plots together
#'
#' This function prepares a ggplot2 plot of the residuals from the fits
#'
#' @param ggplot object for main plot
#' @param ggplot object for residuals plot
#' @return ggplot2 plot object
#' @export

plot_pretty_gg <- function(main_plot,res_plot){
  gridExtra::grid.arrange(main_plot,res_plot, layout_matrix = rbind(c(1,1),c(1,1),c(2,2)))
}



