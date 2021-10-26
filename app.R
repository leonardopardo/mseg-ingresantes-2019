# load libraries
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
source('bootstrap/loader.R', local = T)

# load defaults
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
source('app/defaults/defaults.R', local = T)

# load defaults
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
source('app/helpers/connections.R', local = T)

# layout
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
source('views/layout/page.R', local = T)

# pages
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
source('views/main/index.R', local = T)

# router
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
source('routes/router.R', local = T)

# UI
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
e_common(
    theme = "walden"
)

ui <- shinyUI(
  
    dashboardPage( 
        
        skin = "black",
        
        dashboardHeader(
            title = HTML("Ingresantes")
        ), 
        
        dashboardSidebar(
            collapsed = TRUE
        ), 
        
        dashboardBody(
            shinyDashboardThemes(
                theme = "onenote"
            ),
            router_ui() 
        )
    )
    
)

# Server
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
server <- shinyServer(function(input, output, session) {
    router(input, output, session)
})

# Run server in a standard way.
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
shinyApp(ui, server)
