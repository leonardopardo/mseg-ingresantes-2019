page <- function(title, content) {
    
    fluidPage(
        fluidRow(
            column(
                width = 12,
                h3(title), 
                div(content)
            )
        ),
        
        fluidRow(
            column(
                width = 10,
                h4(
                    "style" = "border-bottom:#ccc 1px solid; padding-bottom:5px; margin-bottom:2px;",
                    HTML("Direcci&oacute;n de Explotaci&oacute;n de Datos y Gesti&oacute;n del Conocimiento.")
                ),
                p(
                    "style" = "margin-bottom:0;",
                    "class" = "text-muted",
                    HTML("Direcci&oacute;n General de Recursos Inform&aacute;ticos y Comunicaciones.")
                ),
                tags$small(
                    "style" = "margin-bottom:0;",
                    "class" = "text-muted",
                    HTML("Subsecretar&iacute;a de Coordinaci&oacute;n y Log&iacute;stica Operativa")
                )
            ),
            column(
                width = 2,
                shiny::img(
                    src = "https://www.mseg.gba.gov.ar/assets/img/logo_ministerio.svg", 
                    "style" = "padding-top:10px;",
                    "class" = "img-responsive "
                )
            )
        )
    )
    
}