# -----------------------------------------------------------
# Script: AnalisisDescriptivo.R
# Fecha: 04-Feb-2025
# Descripción: Hacer un análisis descriptivo de los datos.
# Autor: Javier Amaya Nieto
# -----------------------------------------------------------


library(openxlsx)

# Cargar datos limpios
datos <- read.csv(file.path(ruta_proyecto, "data/processed/datos_limpios.csv"))

# Análisis descriptivo
summary(datos)

# Crear tabla de resumen
tabla_resumen <- summary(datos)