# variables.tf

# Ruta al archivo de credenciales de Google Cloud
variable "credentials_file" {
  description = "Ruta al archivo de credenciales JSON de Google Cloud"
  type        = string
}

# ID del proyecto de Google Cloud
variable "project_id" {
  description = "ID del proyecto de Google Cloud"
  type        = string
}

# Región en la que se desplegarán los recursos
variable "region" {
  description = "Región en la que se desplegarán los recursos"
  type        = string
  default     = "us-central1"
}

# Zona en la que se desplegarán los recursos
variable "zone" {
  description = "Zona en la que se desplegarán los recursos"
  type        = string
  default     = "us-central1-c"
}

# Tipo de máquina para la instancia
variable "machine_type" {
  description = "Tipo de máquina para la instancia"
  type        = string
  default     = "f1-micro"
}

# Imagen del sistema operativo para la instancia
variable "image" {
  description = "Imagen del sistema operativo para la instancia"
  type        = string
  default     = "debian-12-bookworm-v20240611"
}
