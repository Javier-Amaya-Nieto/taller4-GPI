# -----------------------------------------------------------
# Script: AnalisisDescriptivo.R
# Fecha: 04-Feb-2025
# Descripción: Hacer un análisis descriptivo de los datos.
# Autor: Javier Amaya Nieto
# -----------------------------------------------------------


# Posicionando el wd en la raíz del proyecto
getwd()
#setwd("../")
ruta_proyecto <- print(getwd())
print(paste0("Ruta-proyecto en Descriptivo de datos: ",ruta_proyecto))

# Librerias
renv::restore()
library(openxlsx)

# Cargar datos limpios
datos <- read.csv(file.path(ruta_proyecto, "data/processed/datos_limpios.csv"))

# Análisis descriptivo
summary(datos)

# Crear tabla de resumen
tabla_resumen <- summary(datos)
write.xlsx(tabla_resumen, file.path(ruta_proyecto, "results/tables/tabla_resumen.xlsx"))

# Exportar gráficas
png(file.path(ruta_proyecto, "results/figures/histograma_trasplantes.png"))
hist(datos$Numero_trasplantes, main = "Distribución del Número de Trasplantes", xlab = "Número de Trasplantes", col = "yellow")
dev.off()

png(file.path(ruta_proyecto, "results/figures/histograma_visualizaciones.png"))
hist(datos$Visualizaciones_serie, main = "Distribución de Visualizaciones de la Serie", xlab = "Visualizaciones", col = "brown")
dev.off()

png(file.path(ruta_proyecto, "results/figures/boxplot_trasplantes_ano.png"))
boxplot(datos$Numero_trasplantes ~ datos$Año, main = "Número de Trasplantes por Año", xlab = "Año", ylab = "Número de Trasplantes")
dev.off()
