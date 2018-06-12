library(plyr)
library(dplyr)
library(magrittr)
library(rgdal)


filenames <- Sys.glob('maps/*.kml')

coords <- data.frame(longitude = numeric(),latitude = numeric())

extract_coords = function(x){
  
  file <- readOGR(x,require_geomType = 'wkbLineString')
  
  
  file <- file                    %>%
          coordinates(.)          %>%
          unlist(.,recursive = F) %>%
          ldply(.)                %>%
          as.data.frame(.)        %>%
          set_colnames(c('longitude','latitude'))

  return (file)
}

for (file in filenames){
  
  coords <- rbind(coords,extract_coords(file))

}

write.csv(coords,file = 'coordinates.csv',row.names = F)
