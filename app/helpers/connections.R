#' 
#' Ejecuta una consulta en un servidor PostgreSQL.
#'
#' @param params list
#' @param query string
#'
#' @return DataFrame
#' 
#' @example params = list("host"="127.0.0.1", "port"="5432", "dbname" = "Example", "user" = "username", "password"="pwd")
#' @example query = "SELECT * FROM table"
#'
pgQuery <- function(params, query){
  
  out <- tryCatch(
    {
      RPostgreSQL::PostgreSQL()
      
      connection <- dbConnect(
        DBI::dbDriver("PostgreSQL"),
        host = params["host"], 
        port = params["port"], 
        dbname = params["dbname"], 
        user = params["user"], 
        password = params["password"]
      )
      
      query <- dbGetQuery(connection, query)
    },
    error = function(cond) {
      message("Error: ")
      message(cond)
    },
    warning = function(cond){
      message("Warning: ")
      message(cond)
    },
    finally = {
      dbDisconnect(connection)
    }
  )
  
  out
}



#' 
#' Ejecuta una consulta en un servidor SQL Server.
#'
#' @param connection string
#' @param query string
#'
#' @return DataFrame
#' 
#' @example connection = "driver={SQL Server};server={ip};database={name}; Integrated Security={bool}"
#' 
sqlServerQuery <- function(connection, query){
  
  out <- tryCatch(
    {
      cn <- RODBC::odbcDriverConnect(connection)
      
      query <- sqlQuery(cn, query)
    },
    error = function(cond){
      message("Error: ")
      message(cond)
    },
    warning = function(cond){
      message("Warning: ")
      message(cond)
    },
    finally = {
      RODBC::odbcClose(cn)
    }
  )
  
  out
}
