---
title: The caryscan package
author: Jonathan Bramble
date: 18 May 2017
---

caryscan
========

- **Author**: Jonathan Bramble
- **Licence**: [MIT](http://opensource.org/licenses/MIT)
- [Source](https://github.com/jonbramble/caryscan)

`caryscan` is an R package to process and plot spectral data taken on the cary eclipse spectrophotometer instrument. 

The version of the cary software may mean this doesn't work for you. My spectrophotometer is pretty old. 


Installation
------------

```{r}
library(devtools)
install_github("jonbramble/caryscan")
```

Usage
-----

Save the data on the spectrometer in "Spreadsheet ASCII csv mode"

```{r}
library(caryscan)

filename <- "data_file_1.csv"
path <- "C:\\Users\\user\\Documents\\Data\\cary\\date"

#import the data, nlines is the number of datapoints and scans is the number of repeats
df_1 <- import_data(path,filename,nlines=121,scans=10)

#quick plot
plot_all(df_1,scans=10)

#plot mean of all scans
plot_mean(df_1,scans=10)

#write out mean to file for fitting externally eg fityk package
filename <- "data_file_1_out.csv"
write_mean(path,filename)
```

TODO
----
 - add native fitting functions, background subtraction and wavelength limits 
