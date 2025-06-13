terraform {
  required_providers {
    oci = {
      source = "hashicorp/oci"
    }
  }
}

provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  fingerprint  = var.fingerprint
  user_ocid    = var.user_ocid
  region               = var.region
  config_file_profile  = "DEFAULT"
}
