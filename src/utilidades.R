

# Función para revisar datos crudos
revisar_datos_crudos <- function(file_path) {
  # Verificar el tipo de archivo
  tipo_archivo <- tools::file_ext(file_path)
  if (tipo_archivo != "csv") {
    stop("El archivo no es un CSV.")
  }
  
  # Leer el archivo
  datos <- read.csv(file_path)
  
  # Número de observaciones y variables
  num_observaciones <- nrow(datos)
  num_variables <- ncol(datos)
  
  # Peso del archivo
  peso_archivo <- file.info(file_path)$size / 1024  # en KB
  
  # Resumen de la revisión
  resumen <- list(
    Tipo_archivo = tipo_archivo,
    Numero_observaciones = num_observaciones,
    Numero_variables = num_variables,
    Peso_archivoKB = peso_archivo
  )
  
  return(resumen)
}