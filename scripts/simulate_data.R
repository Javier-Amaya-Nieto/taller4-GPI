# -----------------------------------------------------------
# Script: simulate_data.R
# Fecha: 04-Feb-2025
# Descripción: Genera datos sintéticos para evaluar el impacto de una serie de Netflix 
#     sobre el número de trasplantes.
# Autor: Javier Amaya Nieto
# -----------------------------------------------------------

# Posicionando el wd en la raíz del proyecto
getwd()
#setwd("../")
ruta_proyecto <- print(getwd())
print(paste0("Ruta-proyecto en Simulación de datos: ",ruta_proyecto))


# Verificando si el paquete renv está instalado
if (!requireNamespace("renv", quietly = FALSE)) {
  # Si no está instalado, instalarlo
  install.packages("renv")
}

# Restaurando el ambiente R usando el paquete renv
library(renv)
#source("renv/activate.R")
#renv::status()
#renv::init(bare = T)
#renv::activate()
renv::restore()

# Cargar funciones modulares de simulación desde src/
source(file.path(ruta_proyecto,"src/funciones_simulacion.R"))

# Generar datos sintéticos incluyendo algunos NAs
set.seed(123)
datos <- generar_datos_simulados(n=100, start_year = 2010, finish_year = 2024, replace = TRUE)

# Guardar datos crudos en la ruta especificada
write.csv(datos, file.path(ruta_proyecto, "data/raw/datos_crudos_simulated.csv"), row.names = FALSE)


