
output "instance_external_ip" {
  description = "La IP externa asignada a la instancia de Google Compute Engine."
  value       = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}

output "ssh_user" {
  description = "Usuario SSH para conectarse a la instancia"
  value       = "debian" 
}