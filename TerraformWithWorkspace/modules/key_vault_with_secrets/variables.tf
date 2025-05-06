variable "vault_name" {
  description = "The Key Vault name"
  type = string
}

variable "tenant_id" {
  description = "The Azure Tenant ID"
  type = string
}

variable "resource_group_details" {
  description = "Details about the resource group"
  type = object({
    name = string
    location = string
  })
}

variable "secrets" {
  description = "Map of secrets to create in the Key Vault"
  type        = map(string)
  sensitive = true
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default = {}
}