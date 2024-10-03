resource "azurerm_service_plan" "this" {
  count               = var.create_service_plan ? 1 : 0
  name                = "${var.product}-asp-${var.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name
}

resource "azurerm_windows_function_app" "this" {
  count               = var.os_type == "Windows" ? 1 : 0
  name                = "${var.name}-${var.env}"
  resource_group_name = var.resource_group_name
  location            = var.location

  storage_account_name       = module.functions_storage_account.storageaccount_name
  storage_account_access_key = module.functions_storage_account.primary_access_key
  service_plan_id            = var.create_service_plan != true ? var.service_plan_id : azurerm_service_plan.this[0].id

  app_settings = var.app_settings
  https_only   = true

  site_config {
    application_insights_connection_string = "InstrumentationKey=${module.application_insights.instrumentation_key};IngestionEndpoint=https://uksouth-0.in.applicationinsights.azure.com/"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_linux_function_app" "this" {
  count               = var.os_type == "Linux" ? 1 : 0
  name                = "${var.name}"
  resource_group_name = var.resource_group_name
  location            = var.location

  storage_account_name       = module.functions_storage_account.storageaccount_name
  storage_account_access_key = module.functions_storage_account.primary_access_key

  service_plan_id = azurerm_service_plan.this[0].id

  app_settings = var.app_settings
  https_only   = true

  site_config {
    application_insights_connection_string = "InstrumentationKey=${module.application_insights.instrumentation_key};IngestionEndpoint=https://uksouth-0.in.applicationinsights.azure.com/"
  }

  identity {
    type = "SystemAssigned"
  }

}

module "functions_storage_account" {
  source = "github.com/moneyadviceservice/terraform-module-storage-account?ref=add_module"

  env                             = var.env
  storage_account_name            = replace("${var.name}${var.env}", "-", "")
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_kind                    = var.account_kind
  account_tier                    = var.sa_account_tier
  account_replication_type        = var.sa_replication_type
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  default_action                  = var.default_action
}

# TODO
module "application_insights" {
  source = "github.com/moneyadviceservice/terraform-module-application-insights?ref=add_module"

  env                 = var.env
  product             = var.product
  name                = "${var.product}-${var.name}"
  resource_group_name = var.resource_group_name
}
