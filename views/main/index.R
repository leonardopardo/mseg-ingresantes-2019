# bootstrap
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
source('views/main/bootstrap.R', local = T)

# ui
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
source('views/main/gender/ui.R', local = T)
source('views/main/civil_state/ui.R', local = T)
source('views/main/knowledge/ui.R', local = T)
source('views/main/other_knowledge/ui.R', local = T)
# source('views/main/choropleth/ui.R', local = T)

main_index_view <- page(
    div(
      HTML("<i class=\"fa fa-chart-bar\"></i> Estad&iacute;stica de Ingresantes")
    ), 
    div(
        width = 9,
        gender_ui, 
        civil_state_ui, 
        knowledge_ui, 
        other_knowledge_ui
    )
)

# Callback
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
main_index_callback <- function(input, output, session) {
  
  output$box_entering <- renderValueBox(
    valueBox(
      value = count_entering, 
      subtitle = paste(
        "Cantidad de Ingresantes"," ", Sys.Date() %>% lubridate::year()
      ), 
      icon = icon("check")
    )
  )

  # gender
  # ___________________________________________________________ /
  output$gender_donut <- 
      renderEcharts4r(gender_donut_output) 
  
  output$gender_bars <- 
      renderEcharts4r(gender_bar_output)
  
  output$gender_formattable <- 
      renderFormattable(
          formattable(
            count_by_gender,
            list(
              Cantidad = color_bar("lightgreen")
            )
          ) %>%
          rename(
              "G&eacute;nero" = Sexo,
              "Cantidad" = n,
              "Frecuencia" = freq,
              "%" = percent
          )
      )
  
  
  # civil_state
  # ___________________________________________________________ /
  output$civil_state_donut <- 
      renderEcharts4r(civil_state_donut_output)
  
  output$civil_state_bars <- 
      renderEcharts4r(civil_state_bar_output)
  
  output$civil_state_formattable <- 
      renderFormattable(
        formattable(
          count_by_civil_state,
          list(
            Cantidad = color_bar("lightgreen")
          )
        ) %>%
        rename(
          "Estado Civil" = EstadoCivil,
          "Cantidad" = n,
          "Frecuencia" = freq,
          "%" = percent
        )
      )
  
  
  # knowledge
  # ___________________________________________________________ /
  output$knowledge_other_education_donut <- 
      renderEcharts4r(knowledge_other_education_donut_output)
  
  output$knowledge_other_education_bars <- 
      renderEcharts4r(knowledge_other_education_bar_output)
  
  output$knowledge_other_education_table <- 
      renderFormattable(
        formattable(
          count_by_other_education,
          list(
            Cantidad = color_bar("lightgreen")
          )
        ) %>% 
        rename(
          "Otros Estudios" = TipoOtroEstudio,
          "Cantidad" = n,
          "Frecuencia" = freq,
          "%" = percent
        )
      )
  
  
  # other knowledge
  # ___________________________________________________________ /
  
  # cant drive
  output$knowledge_drive_donut <- 
      renderEcharts4r(knowledge_drive_donut_output)
  
  output$knowledge_drive_table <- 
      renderFormattable(
          formattable(
            count_by_licence
          ) %>%
          rename(
            "Tiene Licencia" = PoseeLicenciaConducir,
            "Cantidad" = n,
            "Frecuencia" = freq,
            "%" = percent
          )
      )
  
  # know computing
  output$knowledge_computing_donut <- 
    renderEcharts4r(knowledge_computing_donut_output)
  
  output$knowledge_computing_table <- 
    renderFormattable(
      formattable(
        count_by_computing
      ) %>% 
      rename(
        "Computacion" = ConoceComputacion,
        "Cantidad" = n,
        "Frecuencia" = freq,
        "%" = percent
      )
    )

  # know english
  output$knowledge_lang_english_donut <- 
    renderEcharts4r(knowledge_lang_english_donut_output)
    
  
  output$knowledge_lang_english_table <- 
    renderFormattable(
      formattable(
        count_by_english_lang
      ) %>% 
      rename(
        "Ingles" = ConoceIngles,
        "Cantidad" = n,
        "Frecuencia" = freq,
        "%" = percent
      )
    )
  
  # know other lang
  output$knowledge_other_lang_donut <- 
      renderEcharts4r(knowledge_other_lang_donut_output)
  
  output$knowledge_other_lang_table <- 
    renderFormattable(
      formattable(
        count_by_other_lang
      ) %>% 
      rename(
        "Otro Idioma" = ConoceOtros,
        "Cantidad" = n,
        "Frecuencia" = freq,
        "%" = percent
      )
    )

}
