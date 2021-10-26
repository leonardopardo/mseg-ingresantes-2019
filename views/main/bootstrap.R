# data <- read.csv2(
#   file = "data/datos.csv",
#   sep = ";",
#   stringsAsFactors = T
# )

data.query <- "select 
  NacidoProvincia,
  Sexo,	
  EstadoCivil,	
  CantHijos,	
  DomicilioPartido,	
  DomicilioProvincia,
  ComisariaJurisdiccional,
  Departamental,
  PoseeLicenciaConducir,
  TituloSecundario,
  TipoOtroEstudio,
  ConoceComputacion,
  ConoceIngles,
  ConoceOtros,
  Edad
from 
  vPostulanteDA 
where 
  year(InscripcionFecha) = 2019"

data <- sqlServerQuery(cnn.sql, data.query)

count_entering <- data %>% 
  count()

born_max <- data$Edad %>% 
  max(na.rm = T) %>% 
  as.integer()

born_min <- data$Edad %>% 
  min(na.rm = T) %>% 
  as.integer()

count_born_location <- data %>% 
  group_by(NacidoProvincia) %>% 
  summarise(n = n())

distinct_civil_state <- data$EstadoCivil %>% 
  as.data.frame() %>% 
  distinct() 

count_by_gender <- data %>% 
  group_by(Sexo) %>% 
  summarise(n = n()) %>%
  arrange(desc(n)) %>% 
  mutate(
      freq = n /sum(n),
      percent = freq * 100
  )

count_by_civil_state <- data %>% 
  group_by(EstadoCivil) %>% 
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  mutate(
    freq = n / sum(n),
    percent = freq * 100
  )

count_childrens <- data %>% 
  group_by(CantHijos) %>% 
  summarise(n = n())

count_by_born <- data %>% 
  group_by(Edad) %>% 
  summarise(n = n())

count_by_location_address <- data %>% 
  group_by(DomicilioPartido) %>% 
  summarise(n = n()) %>%
  arrange(desc(n))

count_by_location_state <- data %>% 
  group_by(DomicilioProvincia) %>% 
  summarise(n = n()) %>%
  arrange(desc(n))

count_by_dependency <- data %>% 
  group_by(ComisariaJurisdiccional) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))

count_by_dependency_parent <- data %>% 
  group_by(Departamental) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))

count_by_other_education <- data %>% 
  group_by(TipoOtroEstudio) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n)) %>% 
  mutate(
    freq = n / sum(n),
    percent = freq * 100
  )

count_by_licence <- data %>% 
  group_by(PoseeLicenciaConducir) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n)) %>% 
  mutate(
    freq = n /sum(n),
    percent = freq * 100
  )

count_by_computing <- data %>% 
  group_by(ConoceComputacion) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))%>% 
  mutate(
    freq = n / sum(n),
    percent = freq * 100
  )

count_by_english_lang <- data %>%
  group_by(ConoceIngles) %>%
  summarise(n = n()) %>% 
  arrange(desc(n))%>% 
  mutate(
    freq = n / sum(n),
    percent = freq * 100
  )

count_by_other_lang <- data %>%
  group_by(ConoceOtros) %>%
  summarise(n = n()) %>% 
  arrange(desc(n))%>% 
  mutate(
    freq = n / sum(n),
    percent = freq * 100
  )
