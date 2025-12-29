library(tidyverse)


# Ejecutamos la descarga para toda la lista
urls_años %>% walk(~descargar_y_extraer_dnrpa(url_zip = .x, carpeta_destino = "data/raw"))
