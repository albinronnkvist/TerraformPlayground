variable "environment" {
  description = "Deployment environment (e.g., development, staging, production)"
  type = string
}

variable "tenant_id" {
  description = "The Azure Tenant ID to deploy to"
  type        = string
}

variable "subscription_id" {
  description = "The Azure Subscription ID to deploy to"
  type        = string
}

variable "location" {
  description = "Azure location"
  type = string
  default = "swedencentral"
}