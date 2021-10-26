withSpinnerDefault <- function(x) {
    x %>% withSpinner(type = getOption("spinner.type", default = 7))
}

collapsedDefault <- function(collapse = TRUE){
    return(collapse)
}