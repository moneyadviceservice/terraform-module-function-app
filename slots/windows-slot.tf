resource "azurerm_windows_function_app_slot" "this" {
  count = lower(var.slot_os_type) == "windows" ? 1 : 0

  name           = "func-${var.name}-staging-slot"
  function_app_id = var.id

  public_network_access_enabled = var.public_network_access_enabled
  virtual_network_subnet_id     = var.enable_vnet_integration == true ? var.subnet_id : null
  app_settings                  = var.app_settings
  https_only                    = var.https_only
  storage_account_name          = module.functions_storage_account.storageaccount_name

  site_config {
    ftps_state             = var.ftps_state
    app_command_line       = var.app_command_line
    vnet_route_all_enabled = var.enable_vnet_integration == true ? true : null
    dynamic "application_stack" {
      for_each = var.dotnet_stack ? [1] : []
      content {
        dotnet_version = var.dotnet_stack == true ? var.dotnet_version : null

      }
    }
  }

  dynamic "connection_string" {
    for_each = var.connection_strings
    content {
      name  = lookup(connection_string.value, "name", null)
      type  = lookup(connection_string.value, "type", null)
      value = lookup(connection_string.value, "value", null)
    }
  }
  identity {
    type = "SystemAssigned"
  }
}
