variable "resource_group_name" {
  type        = string
  description = "Name for the resource group. Required."
  validation {
    condition     = length(var.resource_group_name) < 20
    error_message = "Name must be less than 20 characters."
  }
}

variable "keyvault_name" {
  type        = string
  description = "Name for the azure key vault resource. Required."
  default     = "keyvault"
}

variable "suffix" {
  type        = string
  description = "Suffix to avoid automation errors on Azure resources that require globally unique names. Defaults to empty string."
  default     = ""
}

variable "location" {
  type        = string
  description = "Location used for all resources in this project. Defaults to 'East US'"
  default     = "East US"
}


# Calculated Values
# -----------------

locals {
  name          = lower("${var.name}%{if var.suffix != ""}-${var.suffix}%{endif}")
  name_squished = replace(local.name, "-", "")
}
