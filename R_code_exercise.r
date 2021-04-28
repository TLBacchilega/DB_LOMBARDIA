# https://stackoverflow.com/questions/57778268/how-to-get-the-max-distance-from-a-point-within-a-polygon-in-r


# How-to-get-the-maximum-distance-of-a-polygon-in-R

# import data
install.packages("rgdal")
library(rgdal)
setwd("C:/Lombardia/") # Windows 
# read data readOGR("name_file.shp")
Lombardia <- readOGR("unità_territoriali.shp")
plot(Lombardia)
summary(Lombardia)
Lombardia$ID
# select polygon e.g. ID=1
sel_poly <- Lombardia[Lombardia$ID == "1", ]
plot(sel_poly)

install.packages("spatstat")
library(spatstat)


# https://www.rdocumentation.org/packages/spatstat/versions/1.56-1/topics/vertices
# https://www.rdocumentation.org/packages/spatialEco/versions/1.3-5/topics/extract.vertices
# http://rseek.org






# reprex
## https://www.tidyverse.org/help/


