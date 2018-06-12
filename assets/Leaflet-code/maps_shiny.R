library(leaflet)
library(shiny)
library(mapview)
library(htmltools)
library(htmlwidgets)

coords <- read.csv('coordinates.csv',header = T,sep = ',',na.strings = "")

image_coords <- na.omit(coords)

images <- c("https://drive.google.com/uc?id=1M4bnpJM967VC-nSiAqfr5Mtygj4Qvg3K",
            "https://drive.google.com/uc?id=1UmdIBEOfnu46MishRPXo59jrxOS8MGKR",
            "https://drive.google.com/uc?id=1B2xJYqJR390656q6sZ__FgCQxS3-REc-",
            "https://drive.google.com/uc?id=1QNfscCKQ3h9pCfHlgZIznQvZPMhuqtqi",
            "https://drive.google.com/uc?id=14qTjFUzO5YdjM_2R6IEEfXP8oefDwbNi",
            "https://drive.google.com/uc?id=1MhQz2KOuu_VzPKYl3srnvY4uitP8Z2Vg")

widget <- leaflet() %>%
  addTiles('https://cartodb-basemaps-{s}.global.ssl.fastly.net/dark_all/{z}/{x}/{y}.png',
            attribution =  '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> &copy; <a href="http://cartodb.com/attributions">CartoDB</a>') %>%
  
  addCircles(data = coords,~longitude, ~latitude, weight = 2, radius=30, 
           color="#ffa500", stroke = TRUE, fillOpacity = 0.5) %>%
  addMarkers(data = image_coords,popup =popupImage(images,'remote'))

saveWidget(widget, "maps1.html")
