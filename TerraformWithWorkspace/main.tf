terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  cloud {
    organization = "TerraformPlaygroundAlbin"
    workspaces {
      tags = ["buyer"]
    }
  }
}

provider "azurerm" {
  features {}

  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

data "azurerm_client_config" "current" {}

locals {
  required_tags = {
    environment = terraform.workspace
  }
}

resource "azurerm_resource_group" "example_rg" {
  name     = "example-rg"
  location = var.location
  tags = local.required_tags
}

module "example_kv" {
  source = "modules/key_vault_with_secrets"
  
  vault_name = "example-kv-${var.environment}"
  tenant_id = data.azurerm_client_config.current.tenant_id
  resource_group_details = {
    name = azurerm_resource_group.example_rg.name
    location = azurerm_resource_group.example_rg.location
  }
  secrets = {
    "example-secret" = "SuperSecret123!" # encrypt
  }
  tags = local.required_tags
}
