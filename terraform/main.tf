variable "name" {
  type        = string
  description = "Name of the Container App Environment"
}

variable "location" {
  type        = string
  description = "Azure region for the resources"
}

variable "env_code" {
  type        = string
  description = "Three letter environment code"
}

provider "azurerm" {
  features {}
}

locals {
  resource_group_name = lower("v1vhm-rg-${var.name}-${var.env_code}-${var.location}")
  workspace_name      = lower("${var.name}-law")
}

resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = var.location
}

module "aca_environment" {
  source              = "../modules/aca_environment"
  name                = var.name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  workspace_name      = local.workspace_name
}

output "name" {
  value = var.name
}

output "location" {
  value = var.location
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "workspace_name" {
  value = module.aca_environment.workspace_name
}
