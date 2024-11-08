# terraform-module-function-app
A Terraform module for the creation of [Function Apps](https://learn.microsoft.com/en-us/azure/azure-functions/functions-overview?pivots=programming-language-csharp)

## Example

```hcl
module "this" {
  source = "git@github.com:moneyadviceservice/terraform-module-function-app?ref=main"

  product = var.product
  env     = var.env

  resource_group_name = data.azurerm_resource_group.this.name
}

```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_application_insights"></a> [application\_insights](#module\_application\_insights) | github.com/moneyadviceservice/terraform-module-application-insights | add_module |
| <a name="module_functions_storage_account"></a> [functions\_storage\_account](#module\_functions\_storage\_account) | github.com/moneyadviceservice/terraform-module-storage-account | add_module |

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_function_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app) | resource |
| [azurerm_service_plan.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |
| [azurerm_windows_function_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_function_app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | (Optional) Defines the Kind of account | `string` | `"StorageV2"` | no |
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | (Required) Defines the type of replication to use for this storage account. | `string` | `"ZRS"` | no |
| <a name="input_allow_nested_items_to_be_public"></a> [allow\_nested\_items\_to\_be\_public](#input\_allow\_nested\_items\_to\_be\_public) | (Optional) Allow or disallow nested items within this Account to opt into being public | `bool` | `false` | no |
| <a name="input_app_scale_limit"></a> [app\_scale\_limit](#input\_app\_scale\_limit) | (Optional) The number of workers this function app can scale out to. | `number` | `200` | no |
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | (Optional) A map of key-value pairs for App Settings and custom values. | `map(string)` | n/a | yes |
| <a name="input_create_service_plan"></a> [create\_service\_plan](#input\_create\_service\_plan) | If true a new service plan is created | `bool` | `true` | no |
| <a name="input_default_action"></a> [default\_action](#input\_default\_action) | (Optional) Network rules default action | `string` | `"Allow"` | no |
| <a name="input_dotnet_stack"></a> [dotnet\_stack](#input\_dotnet\_stack) | n/a | `bool` | `false` | no |
| <a name="input_dotnet_version"></a> [dotnet\_version](#input\_dotnet\_version) | (Optional) The version of .NET to use. | `string` | `"v8.0"` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to deploy to | `string` | n/a | yes |
| <a name="input_ftps_state"></a> [ftps\_state](#input\_ftps\_state) | (Optional) State of FTP / FTPS service for this Windows Function App. | `string` | `null` | no |
| <a name="input_java_stack"></a> [java\_stack](#input\_java\_stack) | n/a | `bool` | `false` | no |
| <a name="input_java_version"></a> [java\_version](#input\_java\_version) | (Optional) The version of Java to use. | `string` | `"17"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"UK South"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of your function app | `string` | n/a | yes |
| <a name="input_node_stack"></a> [node\_stack](#input\_node\_stack) | n/a | `bool` | `false` | no |
| <a name="input_node_version"></a> [node\_version](#input\_node\_version) | (Optional) The version of Node to run. | `string` | `"20"` | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | (Required) The O/S type for the App Services to be hosted in this plan. | `string` | `"Linux"` | no |
| <a name="input_product"></a> [product](#input\_product) | The product name | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group your function app will be assigned to | `string` | n/a | yes |
| <a name="input_sa_account_tier"></a> [sa\_account\_tier](#input\_sa\_account\_tier) | (Required) Defines the Tier to use for this storage account | `string` | `"Standard"` | no |
| <a name="input_sa_replication_type"></a> [sa\_replication\_type](#input\_sa\_replication\_type) | n/a | `string` | `"ZRS"` | no |
| <a name="input_service_plan_id"></a> [service\_plan\_id](#input\_service\_plan\_id) | If you want to use an existing service plan | `string` | `null` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | (Required) The SKU for the plan. | `string` | `"Y1"` | no |
| <a name="input_use_dotnet_isolated_runtime"></a> [use\_dotnet\_isolated\_runtime](#input\_use\_dotnet\_isolated\_runtime) | (Optional) Should the DotNet process use an isolated runtime. Defaults to false. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_insights_app_id"></a> [app\_insights\_app\_id](#output\_app\_insights\_app\_id) | n/a |
| <a name="output_function_app_default_hostname"></a> [function\_app\_default\_hostname](#output\_function\_app\_default\_hostname) | n/a |
| <a name="output_function_app_id"></a> [function\_app\_id](#output\_function\_app\_id) | n/a |
| <a name="output_function_app_name"></a> [function\_app\_name](#output\_function\_app\_name) | n/a |
| <a name="output_instrumentation_key"></a> [instrumentation\_key](#output\_instrumentation\_key) | n/a |
| <a name="output_sa_primary_access_key"></a> [sa\_primary\_access\_key](#output\_sa\_primary\_access\_key) | n/a |
<!-- END_TF_DOCS -->