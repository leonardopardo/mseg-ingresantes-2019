# Bootstrap
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
partidos <- read.csv2(
  'gis/partidos_departamentales.csv',
  sep = ';',
  stringsAsFactors = T
)

partidos <- geojsonio::geojson_read(
  "gis/partidos.geojson",
  what = "sp"
)

location_data <- list(name = "Partido", locations = partidos)

leaflet() %>% 
  addTiles() %>% 
  setView(
    lng = -60, 
    lat = -37, 
    zoom = 6
  ) %>% 
  addPolygons()


# Output
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
m <- map(domain = count_entering, location_data = location_data)

choropleth <- function(view = list(lat = -37, lng = -60, zoom = 6.4), 
                location_data = list(name = NULL, locations = NULL), domain = 100, 
                data = NULL, palette = "Blues", bins = 6) {
  
  c <- colorBin(
    palette = palette, 
    domain = domain, 
    bins = bins
  )
  
  m <- leaflet() %>% 
    addTiles() %>% 
    setView(
      lng = view$lng, 
      lat = view$lat, 
      zoom = view$zoom
    )
  
  p <- inner_join(domain, location_data$locations)
  
  
  # ListaPartidos <- unique(Partidos3$Partido)
  # 
  # for  (P in ListaPartidos) {
  #   d <- Partidos3[Partidos3$Partido == P, , drop = FALSE]
  #   
  #   valor <<- d %>% distinct(Total)
  #   
  #   if (is.na(valor)) {       
  #     UnColor=="white"
  #     fill<-0.5
  #     valor<<-0
  #   } else {   
  #     UnColor<-pal(as.numeric(valor))
  #     fill<-1
  #   }
  #   
  #   l <- l %>% 
  #     addPolygons(
  #       data = d , 
  #       lng = ~Lon,
  #       lat = ~Lat, 
  #       popup = paste(P," (", as.character(valor), ")"), 
  #       fillColor = UnColor,
  #       weight = 1,
  #       opacity = 0.2,
  #       color = "black",
  #       dashArray = "3",
  #       fillOpacity = fill,
  #       layerId = P
  #     )
  # }
  # 
  # l <- l %>% 
  #   addLegend(
  #     position = "bottomright", 
  #     pal = pal, 
  #     values = Inscriptos$Total,
  #     title = "Inscripciones", 
  #     opacity = 1
  #   )
  # 
  # l
}

















