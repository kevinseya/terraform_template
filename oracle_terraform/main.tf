# Declara el recurso para obtener los dominios de disponibilidad
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

# Declara el recurso para obtener las imágenes de Ubuntu
data "oci_core_images" "ubuntu" {
  compartment_id      = var.tenancy_ocid
  operating_system    = "Canonical Ubuntu"
  operating_system_version = "22.04"  # Versión de Ubuntu
  shape               = "VM.Standard.E2.1"  # Tipo de máquina que estamos utilizando
}

# Crea una Red Virtual (VCN) en Oracle Cloud
resource "oci_core_virtual_network" "vcn1" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = var.compartment_ocid
  display_name   = "vcn_expo"
  dns_label      = "vcnexpo"
}

# Crea un Gateway de Internet para que las instancias puedan acceder a Internet
resource "oci_core_internet_gateway" "ig" {
  compartment_id = var.compartment_ocid
  display_name   = "ig_expo"
  vcn_id         = oci_core_virtual_network.vcn1.id
}

# Crea una tabla de rutas que enrute todo el tráfico a Internet
resource "oci_core_route_table" "route" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn1.id
  display_name   = "rt_expo"

  route_rules {
    destination        = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.ig.id
  }
}

# Crea una subred dentro de la red virtual (VCN) en el rango de IPs privadas
resource "oci_core_subnet" "subnet1" {
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.vcn1.id
  cidr_block          = "10.0.1.0/24"
  display_name        = "subnet_expo"
  route_table_id      = oci_core_route_table.route.id
  dns_label           = "subnetexpo"
  prohibit_public_ip_on_vnic = false
}
