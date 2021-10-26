# ui
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

knowledge_ui <- fluidRow(
    box(
        width = 12,
        title = HTML("Informaci&oacute;n Academica"),
        collapsible = TRUE,
        collapsed = collapsedDefault(),
        status = "primary",
        solidHeader = TRUE,
        column(
            width = 4,
            div(
                width = 12, 
                echarts4rOutput("knowledge_other_education_donut") %>% 
                  withSpinnerDefault()
            ),
            div(
                width = 12,
                title = p(HTML("Cantidad por G&eacute;nero")),
                formattableOutput("knowledge_other_education_table") %>% 
                  withSpinnerDefault()
            )
        ),
        column(
            width = 8,
            div(
                width = 12,
                echarts4rOutput("knowledge_other_education_bars") %>% 
                  withSpinnerDefault()
            )
        )
    )
)

source('views/main/knowledge/output.R', local = T)