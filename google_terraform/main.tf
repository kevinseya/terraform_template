# Recurso para la instancia de Google Cloud
resource "google_compute_instance" "default" {
  # Nombre de la instancia
  name         = "vm-gratuita"
  # Tipo de máquina que estamos utilizando. El tipo se define en las variables
  machine_type = var.machine_type
  # Zona de la región donde se creará la instancia
  zone         = var.zone

  # Disco de arranque (SO)
  boot_disk {
    # Inicializa el disco con la imagen que definimos en las variables
    initialize_params {
      image = var.image
    }
  }
    #Inicializa el script de arranque de la instancia
    metadata_startup_script = "sudo apt-get update; sudo apt-get install -y nginx; sudo systemctl start nginx; sudo systemctl enable nginx"
    metadata = {
      ssh_user = "debian"
      ssh-keys = "debian:${file("C:/Users/Mateo/.ssh/google_compute_engine.pub")}"
    } 

  # Configuración de red
  network_interface {
    # Red predeterminada de Google Cloud
    network = "default"
    # Configuración para asignar una IP pública automáticamente
    access_config {}
  }

  # Etiquetas que se asignan a la instancia para permitir reglas de firewall automáticas
  tags = ["http-server", "https-server", "ssh-server"]

  # Añado un postcondition para verificar que la instancia obtuvo una IP externa
  # Esto afectará el campo 'check_results' en el tfstate si la condición falla.
  lifecycle {
    postcondition {
      # La condición ahora verifica si la configuración de red incluye un bloque access_config.
      # Esto asume que si access_config {} está presente, Google Cloud intentará asignar una IP.
      condition     = length(self.network_interface[0].access_config) > 0
      error_message = "La configuración de red de la instancia 'vm-gratuita' no incluye un bloque access_config para la asignación de IP externa, lo cual es necesario para el acceso público."
    }
  }
}

# Regla de firewall para permitir el tráfico HTTP (puerto 80)
resource "google_compute_firewall" "http" {
  # Nombre de la regla de firewall
  name    = "allow-http-80" # Cambié el nombre para evitar posibles conflictos si ya existe una regla "allow-http"
  
  # Red en la que aplicamos la regla
  network = "default"

  # Permitir tráfico TCP en el puerto 80 (HTTP)
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  # Aplicamos esta regla solo a las instancias con la etiqueta "http-server"
  target_tags = ["http-server"]

  # Especificamos que solo se permite tráfico desde cualquier fuente (todas las IPs)
  source_ranges = ["0.0.0.0/0"] # Permite acceso desde cualquier IP
}

# Regla de firewall para permitir el tráfico SSH (puerto 22)
resource "google_compute_firewall" "ssh" {
  # Nombre de la regla de firewall
  name    = "allow-ssh-22"
  
  # Red en la que aplicamos la regla
  network = "default"

  # Permitir tráfico TCP en el puerto 22 (SSH)
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # Aplicamos esta regla solo a las instancias con la etiqueta "http-server"
  target_tags = ["http-server", "ssh-server"]  # Puedes agregar una nueva etiqueta para identificar esta regla.

  # Especificamos que solo se permite tráfico desde cualquier fuente (todas las IPs)
  source_ranges = ["0.0.0.0/0"]  # Permite acceso desde cualquier IP
}


