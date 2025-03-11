# En este archivo van las funciones de simulación para hacer el código modular
# Especificamente este escript tiene las funciones que se usan en el script de simulación de datos

#Creando una función que genera n cantidad de datos simulados de trasplantes entre un año inicial y uno final
# asumiendo que anualmente se pueden hacer entre 50 y 200 trasplantes. 
# además de esto se incluyen algunos valores faltantes en la data
generar_datos_simulados <- function(n, start_year, finish_year, replace = TRUE) {
  # Generar datos sintéticos
  datos <- data.frame(
    ID = 1:n,
    Año = sample(start_year:finish_year, n, replace = replace),
    Mes = sample(1:12, n, replace = replace),
    Numero_trasplantes = sample(50:200, n, replace = replace),
    Visualizaciones_serie = sample(1000:10000, n, replace = replace)
  )
  
  # Introducir algunos valores faltantes y duplicados
  datos$Numero_trasplantes[sample(1:n, 10)] <- NA
  datos <- rbind(datos, datos[sample(1:n, 5), ])
  
  return(datos)
}