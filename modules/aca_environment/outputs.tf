output "id" {
  value       = azurerm_container_app_environment.this.id
  description = "Container App Environment ID"
}

output "workspace_name" {
  value       = azurerm_log_analytics_workspace.this.name
  description = "Log Analytics workspace name"
}
