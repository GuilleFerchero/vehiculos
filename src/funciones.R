#' Descargar y descomprimir datos de DNRPA
#' @param url_zip URL directa al archivo .zip
#' @param carpeta_destino Camino a la carpeta donde queremos guardar los archivos
#' @return Invisible, descarga y descomprime en disco

descargar_y_extraer_dnrpa <- function(url_zip, carpeta_destino = "data/raw") {

  # 1. Crear la carpeta si no existe
  if (!dir.exists(carpeta_destino)) {
    dir.create(carpeta_destino, recursive = TRUE)
    message(paste("Carpeta creada en:", carpeta_destino))
  }

  # 2. Extraer el nombre del archivo de la URL
  nombre_archivo <- basename(url_zip)
  ruta_destino_zip <- file.path(carpeta_destino, nombre_archivo)

  # 3. Descargar el archivo
  message(paste("Descargando:", nombre_archivo, "..."))
  download.file(url = url_zip,
                destfile = ruta_destino_zip,
                mode = "wb") # 'wb' es fundamental para archivos binarios/zips

  # 4. Descomprimir
  message("Descomprimiendo archivos...")
  unzip(zipfile = ruta_destino_zip, exdir = carpeta_destino)

  # 5. Opcional: Borrar el zip original para ahorrar espacio
  # file.remove(ruta_destino_zip)

  message("¡Proceso completado con éxito!")
}
