# output
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

knowledge_other_education_donut_output <- count_by_other_education %>%
  dplyr::mutate(
    Porcentaje = format(percent, digits = 2)
  ) %>% 
  e_charts(TipoOtroEstudio) %>% 
  e_pie(
    Porcentaje, 
    radius = c("40%", "60%")
  ) %>%
  e_tooltip() %>% 
  e_group("other_education")


knowledge_other_education_bar_output <- count_by_other_education %>%
  e_charts(TipoOtroEstudio) %>% 
  e_bar(n, name = "Cantidad") %>% 
  e_tooltip() %>%
  e_labels(
    position = "right",
    fontSize = 14,
    color = "white",
    backgroundColor = "rgba(0,0,0,0.5)",
    padding = 8,
    borderRadius = 4
  ) %>%
  e_legend(show = F) %>%
  e_flip_coords() %>%
  e_grid(containLabel = TRUE) %>% 
  e_group("other_education") %>% 
  e_connect_group("other_education")