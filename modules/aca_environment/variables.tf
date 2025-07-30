variable "name" {
  type        = string
  description = "Name of the Container App Environment"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "workspace_name" {
  type        = string
  description = "Log Analytics Workspace name"
  default     = null
}
