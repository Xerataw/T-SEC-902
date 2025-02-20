# Variables
variable "resource_group_name" {
  default = "rg-groupe-XX"
}

variable "location" {
  default = "westeurope"
}

variable "vm_count_vnet-internal-001" {
  default = 1
}

variable "vm_count_vnet-connectivity-001" {
  default = 1
}

variable "vm_count_vnet-internal-002" {
  default = 2
}
