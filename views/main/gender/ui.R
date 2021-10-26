# ui
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
gender_ui <- fluidRow(
    
    box(
        width = 12,
        title = HTML("Datos por G&eacute;nero"),
        collapsible = TRUE,
        collapsed = collapsedDefault(),
        status = "primary",
        solidHeader = TRUE,
        column(
            width = 4,
            div(
                width = 12, 
                echarts4rOutput("gender_donut") %>% 
                  withSpinnerDefault()
            ),
            div(
                width = 12,
                title = p(HTML("Cantidad por G&eacute;nero")),
                formattableOutput("gender_formattable") %>% 
                  withSpinnerDefault()
            )
        ),
        column(
            width = 8,
            div(
                width = 12,
                echarts4rOutput("gender_bars") %>% withSpinnerDefault()
            )
        )
    )
    
)

source("views/main/gender/output.R", local = T)