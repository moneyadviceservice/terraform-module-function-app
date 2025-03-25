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

# output "slot_name" {
#   description = "Name of the Function App slot."
#   value       = try(azurerm_linux_function_app_slot.staging[0].name, null)
# }