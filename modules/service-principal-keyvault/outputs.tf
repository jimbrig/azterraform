output "summary" {
  value = {
    resource_group_name = azurerm_resource_group.rg.name
    key_vault           = azurerm_key_vault.kv
  }
}

output "sp_secret" {
  value = random_password.sp_secret.result
}
