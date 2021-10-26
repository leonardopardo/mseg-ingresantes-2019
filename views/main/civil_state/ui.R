# ui
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

civil_state_ui <- fluidRow(
    
    box(
        width = 12,
        title = HTML("Datos por Estado Civil"),
        collapsible = TRUE,
        collapsed = collapsedDefault(),
        status = "primary",
        solidHeader = TRUE,
        column(
            width = 4,
            div(
                width = 12,
                echarts4rOutput("civil_state_donut")
            ),
            div(
                width = 12,
                title = p(HTML("Cantidad por Estado Civil")),
                formattableOutput("civil_state_formattable")
            )
        ),
        column(
            width = 8,
            div(
                width = 12,
                echarts4rOutput("civil_state_bars")
            )
        )
    )
    
)

source('views/main/civil_state/output.R', local = T)