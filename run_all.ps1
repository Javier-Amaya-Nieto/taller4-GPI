# Rutas
$Rscriptpath = "C:\\Program Files\\R\\R-4.3.0\\bin\\x64\\Rscript.exe" # Ruta relativa a Rscript.exe
$scriptDir = ".\scripts"

# Ejecutar script de R
try {
  & $RscriptPath "$scriptDir\simulate_data.R"
  Write-Host "Script de R ejecutado: $scriptPath"
} catch {
  Write-Error "Error al ejecutar el script de R: $($_.Exception.Message)"
}

try {
  & $RscriptPath "$scriptDir\RevisionDatosCrudos.R"
  Write-Host "Script de R ejecutado: $scriptPath"
} catch {
  Write-Error "Error al ejecutar el script de R: $($_.Exception.Message)"
}

try {
  & $RscriptPath "$scriptDir\LimpiezaData.R"
  Write-Host "Script de R ejecutado: $scriptPath"
} catch {
  Write-Error "Error al ejecutar el script de R: $($_.Exception.Message)"
}

try {
  & $RscriptPath "$scriptDir\AnalisisDescriptivo.R"
  Write-Host "Script de R ejecutado: $scriptPath"
} catch {
  Write-Error "Error al ejecutar el script de R: $($_.Exception.Message)"
}

try {
  & $RscriptPath "$scriptDir\AnalisisCorrelacion.R"
  Write-Host "Script de R ejecutado: $scriptPath"
} catch {
  Write-Error "Error al ejecutar el script de R: $($_.Exception.Message)"
}

