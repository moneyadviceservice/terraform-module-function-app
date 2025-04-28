output "function_app_id" {
  value = lower(var.os_type) == "windows" ? azurerm_windows_function_app.this[0].id : azurerm_linux_function_app.this[0].id
}

output "function_app_name" {
  value = lower(var.os_type) == "windows" ? azurerm_windows_function_app.this[0].name : azurerm_linux_function_app.this[0].name
}

output "function_app_default_hostname" {
  value = lower(var.os_type) == "windows" ? azurerm_windows_function_app.this[0].default_hostname : azurerm_linux_function_app.this[0].default_hostname
}

output "instrumentation_key" {
  value = module.application_insights.instrumentation_key
}

output "app_insights_app_id" {
  value = module.application_insights.app_id
}

output "sa_primary_access_key" {
  value = module.functions_storage_account.primary_access_key
}

output "asp_id" {
  value = length(azurerm_service_plan.this) > 0 ? azurerm_service_plan.this[0].id : null
}

output "system_assigned_identity_object_id" {
  value = lower(var.os_type) == "windows" ? azurerm_windows_function_app.this[0].identity[0].principal_id : azurerm_linux_function_app.this[0].identity[0].principal_id
}