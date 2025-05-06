resource "azurerm_key_vault" "example_kv" {
  name                        = var.vault_name
  tenant_id                   = var.tenant_id
  location                    = var.resource_group_details.location
  resource_group_name         = var.resource_group_details.name
  enabled_for_disk_encryption = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name = "standard"
  tags = var.tags
}

resource "azurerm_key_vault_secret" "secrets" {
  for_each     = var.secrets

  name         = each.key
  value        = each.value
  key_vault_id = azurerm_key_vault.example_kv.id
  tags = var.tags
}