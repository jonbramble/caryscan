% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{lognormal}
\alias{lognormal}
\title{lognormal function}
\usage{
lognormal(lambda, c, h, w, b)
}
\arguments{
\item{lambda}{wavelength}

\item{c}{mean}

\item{h}{height}

\item{w}{width}

\item{b}{asymmetry}
}
\description{
\deqn{y(x)=h\exp\left(-\ln(2)\left[\frac{\ln\left(1+2b\frac{x-c}{w}\right)}{b}\right]^2\right)}
}

