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


# https://www.rdocumentation.org/packages/sf/versions/0.9-8/topics/st_coordinates
# sf::st_coordinates per estrarre le coordinate di ciascun vertice (oggetto classe sf, sfc o sfg)
# se importate gli shapefile con sf::st_read avrete già la classe corretta 
# se invece usate un altro pacchetto (e.g. sp o rgdal) dovrete prima convertire l'oggetto nella clase corretta (st_sf o st_as_sf)
# per le distanze dist o sf::st_distance




# import data
install.packages("sf")
library(sf)
# Linking to GEOS 3.9.0, GDAL 3.2.1, PROJ 7.2.1

setwd("C:/Lombardia/") # Windows 

# read data st_read("name_file.shp")
Lombardia <-st_read("unità_territoriali.shp")
# Reading layer `unitÃ _territoriali' from data source `C:\Lombardia\unitÃ _territoriali.shp' using driver `ESRI Shapefile'
# Simple feature collection with 4031 features and 7 fields
#Geometry type: MULTIPOLYGON
#Dimension:     XY
#Bounding box:  xmin: 460668.5 ymin: 4947422 xmax: 691622 ymax: 5165393
#Projected CRS: WGS 84 / UTM zone 32N
summary(Lombardia)
#   ISTAT              COMUNE              PROV              CELLA          
# Length:4031        Length:4031        Length:4031        Length:4031       
# Class :character   Class :character   Class :character   Class :character  
# Mode  :character   Mode  :character   Mode  :character   Mode  :character  
#  REG_BIOG           REG_FOR                ID                  geometry   
# Length:4031        Length:4031        Min.   :     1   MULTIPOLYGON :4031  
# Class :character   Class :character   1st Qu.:  1024   epsg:32632   :   0  
# Mode  :character   Mode  :character   Median :  2021   +proj=utm ...:   0  
                                      # Mean   :  2253                       
                                      # 3rd Qu.:  3038                       
                                      # Max.   :170100  
Lombardia$ID



# select polygon e.g. ID=1
sel_poly <- Lombardia[Lombardia$ID == "1", ]
plot(sel_poly)

# per estrarre le coordinate 
st_coordinates(sel_poly)

# per le distanze dist o sf::st_distance
dist(sel_poly)
# dist(0)
#Warning messages:
# 1: In dist(sel_poly) : si è prodotto un NA per coercizione
# 2: In dist(sel_poly) : si è prodotto un NA per coercizione
# 3: In dist(sel_poly) : si è prodotto un NA per coercizione
# 4: In dist(sel_poly) : si è prodotto un NA per coercizione
# 5: In dist(sel_poly) : si è prodotto un NA per coercizione

st_distance(sel_poly)
# Units: [m]
#    [,1]
# [1,]    0







# reprex
## https://www.tidyverse.org/help/


