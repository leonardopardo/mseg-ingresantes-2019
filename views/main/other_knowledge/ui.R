# view
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
other_knowledge_ui <- fluidRow(
    
    box(
        width = 12,
        title = HTML("Otros Conocimientos"),
        collapsible = TRUE,
        collapsed = collapsedDefault(),
        status = "primary",
        solidHeader = TRUE,
        # computing
        column(
            width = 3,
            column(
                width = 12,
                h3(
                  HTML("Conoce Computaci&oacute;n"),
                  class = "text-center text-muted"
                ),
                div(
                    width = 12,
                    echarts4rOutput("knowledge_computing_donut")
                ),
                div(
                    width = 12,
                    formattableOutput("knowledge_computing_table")

                )
            )
        ),
        # english
        column(
            width = 3,
            h3(
              HTML("Conocimiento de Ingl&eacute;s"),
              class = "text-center text-muted"
            ),
            column(
                width = 12,
                div(
                    width = 12,
                    echarts4rOutput("knowledge_lang_english_donut")
                ),
                div(
                    width = 12,
                    formattableOutput("knowledge_lang_english_table")
                )
            )
        ),
        # other lang
        column(
            width = 3,
            h3(
              HTML("Conoce Otro Idioma"),
              class = "text-center text-muted"
            ),
            column(
                width = 12,
                div(
                    width = 12,
                    echarts4rOutput("knowledge_other_lang_donut")
                ),
                div(
                    width = 12,
                    formattableOutput("knowledge_other_lang_table")
                )
            )
        ),
        # cant drive
        column(
            width = 3,
            h3(
              HTML("Posee Licencia de Conducir"),
              class = "text-center text-muted"
            ),
            column(
                width = 12,
                div(
                    width = 12,
                    echarts4rOutput("knowledge_drive_donut")
                ),
                div(
                    width = 12,
                    formattableOutput("knowledge_drive_table")
                )
            )
        )
        
    )
)

source("views/main/other_knowledge/output.R", local = T)