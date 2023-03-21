variable "location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  default     = "rg-terraform"
  description = "Azure Resource Group Name in your Azure subscription."
}

variable "groups" {
  description = "List of groups to create"
  type = map(map(string)) 
}

variable "default_tags" {
  description = "Default tags to apply to all resources"
  type = map(string)
  default = {
    public      = "true"
    demo        = "true"
    iac         = "terraform"
    ci          = "azure-pipelines"
    environment = "dev"
    owner       = "terraform"
  }
}

variable "custom_tags" {
  description = "Custom tags to apply to all resources"
  type = map(string)
  default = {}
}

