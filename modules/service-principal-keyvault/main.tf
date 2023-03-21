# Resource Group
# --------------

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Service Principal
# -----------------

# 1) Create an "App Registrations" in Azure AD with random password
resource "azuread_application" "app_registration" {
  display_name = "rg-jimbrig-sp"

  depends_on = [
    azurerm_resource_group.rg
  ]
}

resource "random_password" "sp_secret" {
  length           = 30
  special          = true
  min_numeric      = 5
  min_special      = 2
  override_special = "-_%@?"
}

resource "azuread_application_password" "sp_secret" {
  application_object_id = azuread_application.app_registration.object_id
  value                 = random_password.sp_secret.result
  end_date_relative     = "168h" # 7 days
}

# 2) Reference AAD App Registration as Service Principal for next step
resource "azuread_service_principal" "sp" {
  application_id = azuread_application.app_registration.application_id
}

# 3) Scope Service Principal to Resource Group
resource "azurerm_role_assignment" "sp" {
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.sp.id
  scope                = azurerm_resource_group.rg.id
}

# Key Vault
# ---------

# 1) Get reference to local Azure client
data "azurerm_client_config" "current" {}

# 2) Create Key Vault
resource "azurerm_key_vault" "kv" {
  name                        = var.keyvault_name
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7     # minimum
  purge_protection_enabled    = false # so we can fully delete it
  sku_name                    = "standard"
}

# 3) Give local client access to key vault
resource "azurerm_key_vault_access_policy" "self" {
  key_vault_id = azurerm_key_vault.kv.id
  object_id    = data.azurerm_client_config.current.object_id
  tenant_id    = data.azurerm_client_config.current.tenant_id

  secret_permissions = [
    "backup",
    "delete",
    "get",
    "list",
    "purge",
    "recover",
    "restore",
    "set"
  ]
}

# 4) Store Service Principal client ID and secret in Key Vault
# Note: we need to wait for access policy before we can add secrets

resource "azurerm_key_vault_secret" "sp_client_id" {
  name         = "sp-client-id"
  value        = azuread_application.app_registration.application_id
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [
    azurerm_key_vault_access_policy.self
  ]
}

resource "azurerm_key_vault_secret" "sp_client_secret" {
  name         = "sp-client-secret"
  value        = random_password.sp_secret.result
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [
    azurerm_key_vault_access_policy.self
  ]
}
