terraform {

  required_version = ">= 1.4.2"

  backend "azurerm" {}

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.48.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "~>2.36.0"
    }
    azuredevops = {
      source = "microsoft/azuredevops"
      version = "~>0.2.0"
    }
    random = {
      source = "hashicorp/random"
      version = "~>3.1.0"
    }

    # azurestack = {
    #   source = "hashicorp/azurestack"
    #   version = "~>1.0.0"
    # }
    # local = {
    #   source = "hashicorp/local"
    #   version = "~>2.1.0"
    # }
    # tls = {
    #   source = "hashicorp/tls"
    #   version = "~>3.1.0"
    # }
    # null = {
    #   source = "hashicorp/null"
    #   version = "~>3.1.0"
    # }
    # template = {
    #   source = "hashicorp/template"
    #   version = "~>2.2.0"
    # }
    # time = {
    #   source = "hashicorp/time"
    #   version = "~>0.7.0"
    # }
    # archive = {
    #   source = "hashicorp/archive"
    #   version = "~>2.2.0"
    # }
    # cloudinit = {
    #   source = "terraform-providers/cloudinit"
    #   version = "~>2.2.0"
    # }
  }
}

provider "azurerm" {
  features {}

  # subscription_id   = var.subscription_id # "<azure_subscription_id>"
  # tenant_id         = var.tenant_id # "<azure_subscription_tenant_id>"
  # client_id         = var.client_id # "<service_principal_appid>"
  # client_secret     = var.client_secret # "<service_principal_password>"
}

provider "azuread" {}
