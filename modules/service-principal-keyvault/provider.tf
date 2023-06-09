terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.50.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~>1.3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0.1"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}
