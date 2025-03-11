# -----------------------------------------------------------
# Script: RevisionDatosCrudos.R
# Fecha: 04-Feb-2025
# Descripción: Revisa algunas características generales del archivo de 
#     datos crudos entregado para evaluar concordancia en la entrega.
# Autor: Javier Amaya Nieto
# -----------------------------------------------------------

# Posicionando el wd en la raíz del proyecto
getwd()
#setwd("../")
ruta_proyecto <- print(getwd())
print(paste0("Ruta-proyecto en Revision de datos: ",ruta_proyecto))

# Cargar funciones modulares de Revision desde src/
source(file.path(ruta_proyecto,"src/funciones_revision.R"))

# Revisar el archivo de datos crudos
resumen_revision <- revisar_datos_crudos(file.path(ruta_proyecto, "data/raw/datos_crudos.csv"))
print(resumen_revision)


