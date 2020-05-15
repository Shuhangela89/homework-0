getwd()
setwd("/Users/shuhanwang/Desktop/R-scripts/EDX-Excercises/Data_Wrangling")
library(tidyverse)
url <- "http://mlr.cs.umass.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"
table <- read_csv(url, col_names = FALSE)
nrow(table)
ncol(table)