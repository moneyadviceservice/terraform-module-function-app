<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_web_app_slot.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app_slot) | resource |
| [azurerm_windows_web_app_slot.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_web_app_slot) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | (Optional) Defines the Kind of account | `string` | `"StorageV2"` | no |
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | (Required) Defines the type of replication to use for this storage account. | `string` | `"ZRS"` | no |
| <a name="input_app_command_line"></a> [app\_command\_line](#input\_app\_command\_line) | (Optional) The App command line to launch. | `string` | `null` | no |
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | (Optional) A map of key-value pairs for App Settings and custom values. | `map(string)` | `{}` | no |
| <a name="input_connection_strings"></a> [connection\_strings](#input\_connection\_strings) | Connection strings for App Service. See documentation | `list(map(string))` | `[]` | no |
| <a name="input_create_service_plan"></a> [create\_service\_plan](#input\_create\_service\_plan) | If true a new service plan is created | `bool` | `true` | no |
| <a name="input_dotnet_stack"></a> [dotnet\_stack](#input\_dotnet\_stack) | n/a | `bool` | `false` | no |
| <a name="input_dotnet_version"></a> [dotnet\_version](#input\_dotnet\_version) | (Optional) The version of .NET to use. | `string` | `"v8.0"` | no |
| <a name="input_enable_client_affinity"></a> [enable\_client\_affinity](#input\_enable\_client\_affinity) | (Optional) Should Client Affinity be enabled? | `bool` | `false` | no |
| <a name="input_enable_vnet_integration"></a> [enable\_vnet\_integration](#input\_enable\_vnet\_integration) | Enable integration with a virtual network | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to deploy to | `string` | n/a | yes |
| <a name="input_ftps_state"></a> [ftps\_state](#input\_ftps\_state) | (Optional) State of FTP / FTPS service for this Windows Function App. | `string` | `null` | no |
| <a name="input_https_only"></a> [https\_only](#input\_https\_only) | (Optional) Should the Web App require HTTPS connections. | `bool` | `true` | no |
| <a name="input_id"></a> [id](#input\_id) | (Required) The id of the function app to attach to | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"UK South"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of your function app | `string` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | The product name | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Enable public network access | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group your function app will be assigned to | `string` | n/a | yes |
| <a name="input_sa_account_tier"></a> [sa\_account\_tier](#input\_sa\_account\_tier) | (Required) Defines the Tier to use for this storage account | `string` | `"Standard"` | no |
| <a name="input_service_plan_id"></a> [service\_plan\_id](#input\_service\_plan\_id) | If you want to use an existing service plan | `string` | `null` | no |
| <a name="input_site_config"></a> [site\_config](#input\_site\_config) | Staging slot site config for App Service. | `any` | `{}` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | (Required) The SKU for the plan. | `string` | `"Y1"` | no |
| <a name="input_slot_os_type"></a> [slot\_os\_type](#input\_slot\_os\_type) | (Required) The O/S type for the App Services to be hosted in this plan. | `string` | `"Linux"` | no |
| <a name="input_staging_slot_custom_app_settings"></a> [staging\_slot\_custom\_app\_settings](#input\_staging\_slot\_custom\_app\_settings) | Override staging slot with custom app settings. | `map(string)` | `null` | no |
| <a name="input_staging_slot_enabled"></a> [staging\_slot\_enabled](#input\_staging\_slot\_enabled) | Create a staging slot alongside the App Service for blue/green deployment purposes. See [documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_slot). | `bool` | `true` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet to connect to | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags assigned to the Resource. | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->