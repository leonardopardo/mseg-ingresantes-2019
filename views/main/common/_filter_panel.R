filter_panel <- fluidRow(
    
    box(
        status = "primary",
        width = 3,
        title = HTML('<i class="fa fa-filter"></i> Filtros'),
        column(
            width = 12,
            dateRangeInput(
                "date_input_range",
                label = "Fecha de Inscripcion",
                format = "d/m/yyyy",
                language = "es",
                separator = "al",
                start = Sys.Date()-30
                
            )
        ),
        column(
            width = 12,
            selectInput(
                "location_input_select",
                label = "Lugar de Inscripcion",
                choices = c('A', 'B')
            )
        ),
        column(
            width = 12,
            sliderInput(
                "year_range_input", 
                "Edad:",
                min = born_min, 
                max = born_max,
                value = c(17,26)
            )
        ),
        column(
            width = 12,
            selectInput(
                "education_input_select",
                label = "Nivel Educativo",
                choices = c('A', 'B')
            )
        ),
        column(
            width = 12,
            selectInput(
                "education_input_select",
                label = "Estado Civil",
                choices = c('A', 'B')
            )
        ),
        column(
            width = 12,
            actionButton(
                "action_filter", 
                "Aplicar Filtros",
                icon = icon("cog"),
                "class" = "btn-block"
            ),
            actionButton(
                "action_reset", 
                "Limpiar Filtros",
                icon = icon("eraser"),
                "class" = "btn-block"
            ),
            br()
        )
    )
)