#' write average data to file
#'
#' @param df dataframe of spectroscopy data imported using caryscan package
#' @param path to filename
#' @export
write_mean <- function(df,path){
  dout <- df[,c('Wavelength','fluo_mean')]
  write.csv(dout,path,row.names = FALSE)
}

#' melts data in preparation for ggplot2 plots
#'
#' @param df dataframe of spectroscopy data imported using caryscan package
#' @export
melt_data <- function(df){
  reshape2::melt(dat,id=c('Wavelength'),variable.name = 'Scan', value.name = 'Em')
}

#' lognormal function
#'
#' \deqn{y(x)=h\exp\left(-\ln(2)\left[\frac{\ln\left(1+2b\frac{x-c}{w}\right)}{b}\right]^2\right)}
#'
#' @param lambda wavelength
#' @param c mean
#' @param h height
#' @param w width
#' @param b asymmetry
#' @export
lognormal <- function(lambda,c,h,w,b) {
  I<- h*exp((-log(2)*(((log(1+2*b*((lambda-c)/w)))/b)^2)))
  return(I)
}

add_lognorm_fit <- function(df,c,h,w,b){
  sapply(df$Wavelength,lognormal, c,h,w,b)
}

sum_fits <- function(df,cols){
  rowSums(df[,cols])
}

fit_residuals <- function(df,name='sum_fits'){
  df[,'fluo_mean']-df[,name]
}



#subtract_background(dat,bg){

#}
