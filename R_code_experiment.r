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






# import data
install.packages("sf") # Simple Feature: import, export and manipulate vector data
# load packages
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

sel_poly
# Simple feature collection with 1 feature and 7 fields
#Geometry type: MULTIPOLYGON
#Dimension:     XY
#Bounding box:  xmin: 480635.6 ymin: 5097223 xmax: 482813.5 ymax: 5099096
#Projected CRS: WGS 84 / UTM zone 32N
#    ISTAT COMUNE   PROV        CELLA REG_BIOG          REG_FOR ID
#2 03012001   AGRA VARESE 10kmE422N254      ALP Esalpica Interna  1
#                       geometry
#2 MULTIPOLYGON (((480647.8 50...



# https://www.rdocumentation.org/packages/sf/versions/0.9-8/topics/st_coordinates

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

# calculate distance
st_distance(sel_poly) # distance in meters
# Units: [m]
#    [,1]
# [1,]    0


m_distance <- st_distance(sel_poly)
# matrix
dim(m_distance)
# [1] 1 1

# https://www.r-bloggers.com/2020/01/geographic-distance-2/
install.packages("units") # Support for measurement units in R vectors, matrices and arrays: propagation, conversion, derivation
library(units)


# change from m to km
set_units(dist_sel_poly, "km")
# Units: [km]
#     [,1]
# [1,]    0











