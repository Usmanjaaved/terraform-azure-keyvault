variable "prefix" {
  description = "Prefix for the Key Vault name"
  type        = string
}

variable "soft_delete_retention_days" {
  description = "Number of days for soft delete retention"
  type        = number
}

variable "sku_name" {
  description = "SKU name for the Key Vault"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "resource_group_location" {
  description = "Location of the Resource Group"
  type        = string
}


variable "key_permissions" {
  description = "List of key permissions for the Key Vault"
  type        = list(string)
}

variable "secret_permissions" {
  description = "List of secret permissions for the Key Vault"
  type        = list(string)
}