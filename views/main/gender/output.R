# output
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

gender_donut_output <- count_by_gender %>%
  dplyr::mutate(
    Genero = c("Femenino", "Masculino"),
    Porcentaje = format(percent, digits = 4)
  ) %>%
  e_charts(Genero) %>%
  e_pie(
    Porcentaje, 
    radius = c("40%", "60%")
  ) %>% 
  e_tooltip() %>%
  e_labels(show = T) %>%
  e_legend(show = F) %>%
  e_group("gender")

gender_bar_output <- count_by_gender %>%
  dplyr::mutate(
    Genero = c("Femenino", "Masculino")
  ) %>%
  e_charts(Genero) %>%
  e_bar(n, name = "Cantidad") %>%
  e_labels(
    position = "right",
    fontSize = 14,
    color = "white",
    backgroundColor = "rgba(0,0,0,0.5)",
    padding = 8,
    borderRadius = 4
  ) %>%
  e_legend(show = F) %>%
  e_tooltip() %>%
  e_flip_coords() %>%
  e_grid(containLabel = T) %>%
  e_group("gender") %>%
  e_connect_group("gender")
