provider "google" {
  credentials = file(var.credentials_file)  # Ruta al archivo de credenciales
  project     = var.project_id             # ID del proyecto en Google Cloud
  region      = var.region                 # Región donde se desplegarán los recursos
  zone        = var.zone                   # Zona en la que se desplegará la instancia
}
