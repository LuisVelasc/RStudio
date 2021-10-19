# Librerías 
library(dslabs)
library(tidyverse)    # includes readr
library(readxl)

# see working directory
getwd()

# change your working directory
# setwd()

# set path to the location for raw data files in the dslabs package and list files
path <- system.file("extdata", package="dslabs")
list.files(path)

# generate a full path to a file
filename <- "murders.csv"
fullpath <- file.path(path, filename)
fullpath

# copy file from dslabs package to your working directory
file.copy(fullpath, getwd())

# check if the file exists
file.exists(filename)

# inspect the first 3 lines
read_lines("murders.csv", n_max = 3)

# read file in CSV format
dat <- read_csv(filename)

#read using full path
dat <- read_csv(fullpath)
head(dat)

# Se cargan otros datos
path <- system.file("extdata", package = "dslabs")
files <- list.files(path)
files

filename <- "murders.csv"
filename1 <- "life-expectancy-and-fertility-two-countries-example.csv"
filename2 <- "fertility-two-countries-example.csv"
dat=read.csv(file.path(path, filename))
dat1=read.csv(file.path(path, filename1))
dat2=read.csv(file.path(path, filename2))

# read.csv converts strings to character
dat2 <- read.csv(filename)
class(dat2$abb)
class(dat2$region)

# Podemos leer archivos desde GitHub o otros sitios web
url <- "https://raw.githubusercontent.com/rafalab/dslabs/master/inst/extdata/murders.csv"
dat <- read_csv(url)

# Podemos descargar el archivo
download.file(url, "murders2.csv")

# Es para crear un archivo temporal con un nombre que es difícil que ya haya sido ocupado
tempfile()
tmp_filename <- tempfile()       # Nombre temporal
download.file(url, tmp_filename) # Descarga de archivo (dirección, nombre de la descarga)
dat <- read_csv(tmp_filename)    # Se carga en R la data
file.remove(tmp_filename)        # Se borra el archivo


# Ejercicio
url="https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"
download.file(url, "DatosEjercicio")
read_lines("DatosEjercicio", n_max = 3)

help("readr")

DatosEj=read_csv("DatosEjercicio", col_names=FALSE)
dim(DatosEj)
