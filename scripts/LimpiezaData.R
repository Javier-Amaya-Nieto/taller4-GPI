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
#datos <- read.csv(file.path(ruta_proyecto, "data/raw/datos_crudos.csv"))



# Cargar datos crudos desde Zenodo
# Load required packages
if (!require("pacman")) install.packages("pacman")
pacman::p_load(rjson, rio, tidyr, dplyr)

get_zenodo_data <- function(zenodo_id, 
                            api_endpoint = "https://zenodo.org/api/records/",
                            format = "csv") {  # Agregar argumento para especificar el formato
  
  # Step 1: Construct API URL for the specified Zenodo record
  api_url <- paste0(api_endpoint, zenodo_id)
  
  # Step 2: Download metadata from Zenodo API
  message("Downloading metadata from Zenodo...")
  metadata <- fromJSON(file = api_url)
  
  # Step 3: Extract file URLs from the metadata
  file_list <- as.data.frame(metadata$files) %>% 
    select(starts_with("self")) %>% 
    tidyr::gather()
  
  if (nrow(file_list) == 0) {
    stop("No files found in the Zenodo repository")
  }
  
  # Step 4: Download the actual data file from Zenodo
  message("Downloading data file...")
  datos <- import(file_list$value[1], format = format)  # Especificar el formato aquí
  
  # Return the dataset
  return(datos)
}

# Example usage
if (interactive()) {
  # Define Zenodo repository information
  ZENODO_ID <- "15029843"  # ID of the specific Zenodo repository
  
  # Get the survey data directly into an R object
  datos <- get_zenodo_data(zenodo_id = ZENODO_ID, format = "csv")  # Especificar el formato aquí
  
  # Display summary of the imported data
  str(datos)
}


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

