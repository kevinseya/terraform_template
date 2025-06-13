variable "compartment_ocid" {
  description = "The OCID of the compartment"
  type        = string
}

variable "region" {
  description = "The OCI region"
  type        = string
  default     = "sa-bogota-1"
}

variable "tenancy_ocid" {
  description = "tenancy_ocid"
  type        = string
}

variable "fingerprint" {
  description = "fingerprint"
  type        = string
}

variable "user_ocid" {
  description = "user_ocid"
  type        = string
}

variable "ssh_public_key" {
  description = "Path to the public SSH key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
variable "key_file" {
  description = "Path to the private key file"
  type        = string
}
