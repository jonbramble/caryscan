#' write average data to file
#'
#' @param df dataframe of spectroscopy data imported using caryscan package
#' @param path to filename
#' @param filename name of csv file to write to
#' @export
write_mean <- function(df,path,filename){
  full_path <- file.path(path,filename)
  dout <- df[,c('Wavelength','fluo_mean')]
  utils::write.csv(dout,full_path,row.names = FALSE)
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
lognormal <- function(lambda,c,h,w,b) {
  I<- h*exp((-log(2)*(((log(1+2*b*((lambda-c)/w)))/b)^2)))
  return(I)
}


#' normal function
#'
#' @param lambda wavelength
#' @param c mean
#' @param h height
#' @param w width
normal <- function(lambda,c,h,w){
  I<- h*exp((-log(2))*((lambda-c)/w)^2)
  return(I)
}

#' add lognormal fit
#'
#' @param lambda wavelength
#' @param c mean
#' @param h height
#' @param w width
#' @param b asymmetry
#' @export
add_lognorm_fit <- function(df,c,h,w,b){
  sapply(df[,'Wavelength'],lognormal, c,h,w,b)
}

#' add normal fit
#'
#' @param lambda wavelength
#' @param c mean
#' @param h height
#' @param w width
#' @export
add_normal_fit <- function(df,c,h,w){
  sapply(df[,'Wavelength'],normal,c,h,w)
}


#' sum fit columns
#' @param fit_data dataframe containing fit data
#' @param cols names of columns containing fit data #not yet implemented
#' @export
sum_fits <- function(fit_data,cols){
  rowSums(fit_data[,cols])
}
