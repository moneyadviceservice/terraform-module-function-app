resource "azurerm_service_plan" "this" {
  count                  = var.create_service_plan ? 1 : 0
  name                   = "${var.product}-asp-${var.name}"
  resource_group_name    = var.resource_group_name
  location               = var.location
  os_type                = var.os_type
  sku_name               = var.sku_name
  zone_balancing_enabled = var.zone_redundant
  worker_count           = var.zone_redundant == true ? 3 : null
}

resource "azurerm_windows_function_app" "this" {
  count               = var.os_type == "Windows" ? 1 : 0
  name                = "func-${var.name}-${var.env}"
  resource_group_name = var.resource_group_name
  location            = var.location

  storage_account_name       = module.functions_storage_account.storageaccount_name
  storage_account_access_key = module.functions_storage_account.primary_access_key
  service_plan_id            = var.create_service_plan == true ? var.service_plan_id : azurerm_service_plan.this[0].id

  app_settings = var.app_settings
  https_only   = true

  dynamic "connection_string" {
    for_each = var.connection_strings
    content {
      name  = lookup(connection_string.value, "name", null)
      type  = lookup(connection_string.value, "type", null)
      value = lookup(connection_string.value, "value", null)
    }
  }

  public_network_access_enabled = var.public_network_access_enabled
  virtual_network_subnet_id     = var.subnet_id != null ? var.subnet_id : null
  site_config {
    application_insights_connection_string = "InstrumentationKey=${module.application_insights.instrumentation_key};IngestionEndpoint=https://uksouth-0.in.applicationinsights.azure.com/"
    app_scale_limit                        = var.app_scale_limit
    ftps_state                             = var.ftps_state

    dynamic "application_stack" {
      for_each = var.dotnet_stack || var.java_stack || var.node_stack ? [1] : []
      content {
        dotnet_version              = var.dotnet_stack == true ? var.dotnet_version : null
        use_dotnet_isolated_runtime = var.dotnet_stack == true ? var.use_dotnet_isolated_runtime : null
        java_version                = var.java_stack == true ? var.java_version : null
        node_version                = var.node_stack == true ? var.node_version : null

      }
    }
  }
  # scm_ip_restriction {
  #   vnet_route_all_enabled    =  var.enable_vnet_integration == true ? true : null
  # }
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_linux_function_app" "this" {
  count               = var.os_type == "Linux" ? 1 : 0
  name                = "func-${var.name}-${var.env}"
  resource_group_name = var.resource_group_name
  location            = var.location

  storage_account_name       = module.functions_storage_account.storageaccount_name
  storage_account_access_key = module.functions_storage_account.primary_access_key

  service_plan_id = azurerm_service_plan.this[0].id

  app_settings                  = var.app_settings
  https_only                    = true
  public_network_access_enabled = var.public_network_access_enabled
  virtual_network_subnet_id     = var.subnet_id != null ? var.subnet_id : null

  dynamic "connection_string" {
    for_each = var.connection_strings
    content {
      name  = lookup(connection_string.value, "name", null)
      type  = lookup(connection_string.value, "type", null)
      value = lookup(connection_string.value, "value", null)
    }
  }
  site_config {
    application_insights_connection_string = "InstrumentationKey=${module.application_insights.instrumentation_key};IngestionEndpoint=https://uksouth-0.in.applicationinsights.azure.com/"
    app_scale_limit                        = var.app_scale_limit

    dynamic "ip_restriction" {
      for_each = var.enable_vnet_integration == true ? [1] : []
      content {
        virtual_network_subnet_id = var.subnet_id
      }
    }
  }


  identity {
    type = "SystemAssigned"
  }
}

module "functions_storage_account" {
  source = "github.com/moneyadviceservice/terraform-module-storage-account?ref=add_module"

  env                             = var.env
  storage_account_name            = replace(replace("${var.name}${var.env}", "func-", ""), "-", "")
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_kind                    = var.account_kind
  account_tier                    = var.sa_account_tier
  account_replication_type        = var.sa_replication_type
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  default_action                  = var.default_action
  sa_subnets                      = var.subnet_id != null ? ["${var.subnet_id}"] : null
}

module "application_insights" {
  source = "github.com/moneyadviceservice/terraform-module-application-insights?ref=add_module"

  env                 = var.env
  product             = var.product
  name                = "${var.name}-${var.env}"
  resource_group_name = var.resource_group_name
}