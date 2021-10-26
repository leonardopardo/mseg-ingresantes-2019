# output
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

civil_state_donut_output <- count_by_civil_state %>%
  dplyr::mutate(
    Porcentaje = format(percent, digits = 1)
  ) %>%
  e_charts(EstadoCivil) %>% 
  e_pie(
    Porcentaje, 
    radius = c("40%", "60%")
  ) %>% 
  e_tooltip() %>%
  e_group("civil_state") %>%
  e_connect_group("civil_state")


civil_state_bar_output <- count_by_civil_state %>%
  e_charts(EstadoCivil) %>% 
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
  e_legend(show = FALSE) %>%
  e_flip_coords() %>%
  e_grid(containLabel = TRUE) %>%
  e_group("civil_state") %>%
  e_connect_group("civil_state")