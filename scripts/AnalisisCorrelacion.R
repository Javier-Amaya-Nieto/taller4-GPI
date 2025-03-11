# -----------------------------------------------------------
# Script: AnalisisCorrelacion.R
# Fecha: 04-Feb-2025
# Descripción: Hace un análisis de correlación de los datos. 
# Autor: Javier Amaya Nieto
# -----------------------------------------------------------

# Posicionando el wd en la raíz del proyecto
getwd()
#setwd("../")
ruta_proyecto <- print(getwd())
print(paste0("Ruta-proyecto en Correlación de datos: ",ruta_proyecto))

#Librerias
library(corrplot)

# Cargar datos limpios
datos <- read.csv(file.path(ruta_proyecto, "data/processed/datos_limpios.csv"))

# Calcular correlaciones
correlaciones <- cor(datos[, sapply(datos, is.numeric)])
print(correlaciones)

# Visualizar correlaciones
png(file.path(ruta_proyecto, "results/figures/Correlation_matrix_visual.png"))
corrplot(correlaciones, method = "circle")
dev.off()
