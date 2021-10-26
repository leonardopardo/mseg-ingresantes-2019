# output
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

knowledge_computing_donut_output <- count_by_computing %>%
  dplyr::mutate(
    Porcentaje = format(percent, digits = 3)
  ) %>% 
  e_charts(ConoceComputacion) %>%
  e_pie(
    Porcentaje, 
    radius = c("40%", "60%")
  ) %>%
  e_tooltip(
    formatter = e_tooltip_pie_formatter(style = c("decimal"))
  )

knowledge_drive_donut_output <- count_by_licence %>%
  dplyr::mutate(
    Porcentaje = format(percent, digits = 3)
  ) %>% 
  e_charts(PoseeLicenciaConducir) %>%
  e_pie(
    Porcentaje, 
    radius = c("40%", "60%") 
  ) %>%
  e_tooltip(
    formatter = e_tooltip_pie_formatter(style = c("decimal"))
  )

knowledge_lang_english_donut_output <- count_by_english_lang %>%
  dplyr::mutate(
    Porcentaje = format(percent, digits = 3)
  ) %>% 
  e_charts(ConoceIngles) %>%
  e_pie(
    Porcentaje, 
    radius = c("40%", "60%")
  ) %>%
  e_tooltip(
    formatter = e_tooltip_pie_formatter(style = c("decimal"))
  )

knowledge_other_lang_donut_output <- count_by_other_lang  %>%
  dplyr::mutate(
    Porcentaje = format(percent, digits = 3)
  ) %>% 
  e_charts(ConoceOtros) %>%
  e_pie(
    Porcentaje, 
    radius = c("40%", "60%")
  ) %>%
  e_tooltip(
    formatter = e_tooltip_pie_formatter(style = c("decimal"))
  )
