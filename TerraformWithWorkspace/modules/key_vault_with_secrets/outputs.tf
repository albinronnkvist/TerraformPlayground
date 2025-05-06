output "key_vault_uri" {
  description = "Key Vault URI"
  value       = azurerm_key_vault.example_kv.vault_uri
}