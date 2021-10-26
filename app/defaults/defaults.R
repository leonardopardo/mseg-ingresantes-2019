withSpinnerDefault <- function(x) {
    x %>% withSpinner(type = getOption("spinner.type", default = 7))
}

collapsedDefault <- function(collapse = TRUE){
    return(collapse)
}

cnn.sql <- "driver={SQL Server};server=10.62.3.53;database=Ingreso;uid=TableroIngreso;pwd=Ing951753"