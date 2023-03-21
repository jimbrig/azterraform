# ------------------------------------------------------------
# Configuration
# ------------------------------------------------------------

data "azurerm_client_config" "current" {}

locals {
  # The name of the resource group to create
  resource_group_name = "rg-${data.azurerm_client_config.current.tenant_id}"

  # The location to create the resource group in
  location = "westeurope"
}

# ------------------------------------------------------------
# Azure Active Directory - Groups
# ------------------------------------------------------------

resource "azuread_group" "groups" {
  for_each = var.groups
  display_name = ""
  name = "group-${data.azurerm_client_config.current.tenant_id}"
}

# ------------------------------------------------------------
# Resource Group
# ------------------------------------------------------------


resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
