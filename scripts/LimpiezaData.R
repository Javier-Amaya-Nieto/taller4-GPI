# -----------------------------------------------------------
# Script: LimpiezaData.R
# Fecha: 04-Feb-2025
# Descripción: Haciendo una limpieza inicial de los datos
# Autor: Javier Amaya Nieto
# -----------------------------------------------------------


# Posicionando el wd en la raíz del proyecto
getwd()
#setwd("../")
ruta_proyecto <- print(getwd())
print(paste0("Ruta-proyecto en Limpieza de datos: ",ruta_proyecto))

# Cargar datos crudos desde archivo local
datos <- read.csv(file.path(ruta_proyecto, "data/raw/datos_crudos.csv"))

# Revisar datos crudos
summary(datos)
str(datos)

# Eliminar duplicados
duplicated(datos)
datos <- datos[!duplicated(datos), ]

# Manejar valores NA (por ejemplo, reemplazar con la media)
datos$Numero_trasplantes[is.na(datos$Numero_trasplantes)] <- mean(datos$Numero_trasplantes, na.rm = TRUE)

# Guardar datos limpios
write.csv(datos, file.path(ruta_proyecto, "data/processed/datos_limpios.csv"), row.names = FALSE)

