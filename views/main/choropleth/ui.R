# ui
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

map_1 <- fluidRow(
    
    box(
        width = 12,
        title = HTML("Distribuci&oacute;n Geogr&aacute;fica"),
        collapsible = TRUE,
        collapsed = collapsedDefault(),
        status = "primary",
        solidHeader = TRUE,
        column(
            width = 12,
            div(
                width = 12,
                h3("mapa")
            )
        )
    )
    
)

source('views/main/choropleth/output.R', local = T)