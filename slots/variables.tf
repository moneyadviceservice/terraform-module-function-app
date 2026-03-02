variable "resource_group_name" {
  type        = string
  description = "The resource group your function app will be assigned to"
}

variable "name" {
  type        = string
  description = "The name of your function app"
}

variable "location" {
  type    = string
  default = "UK South"
}

variable "env" {
  type        = string
  description = "The environment to deploy to"
}

variable "app_settings" {
  type        = map(string)
  description = "(Optional) A map of key-value pairs for App Settings and custom values."
  default     = {}
}

variable "slot_os_type" {
  type        = string
  description = "(Required) The O/S type for the App Services to be hosted in this plan."
  default     = "Linux"
}

variable "product" {
  type        = string
  description = "The product name"
}

variable "create_service_plan" {
  type        = bool
  description = "If true a new service plan is created"
  default     = true
}

variable "service_plan_id" {
  type        = string
  description = "If you want to use an existing service plan"
  default     = null
}
variable "sa_account_tier" {
  type        = string
  description = "(Required) Defines the Tier to use for this storage account"
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "(Required) Defines the type of replication to use for this storage account."
  default     = "ZRS"
}

variable "account_kind" {
  type        = string
  description = "(Optional) Defines the Kind of account"
  default     = "StorageV2"
}

variable "sku_name" {
  type        = string
  description = "(Required) The SKU for the plan."
  default     = "Y1"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags assigned to the Resource."
  default     = {}
}

variable "enable_client_affinity" {
  type        = bool
  default     = false
  description = "(Optional) Should Client Affinity be enabled?"
}

variable "https_only" {
  type        = bool
  default     = true
  description = "(Optional) Should the Web App require HTTPS connections."
}

variable "ftps_state" {
  type        = string
  description = "(Optional) State of FTP / FTPS service for this Windows Function App."
  default     = null
}

variable "dotnet_stack" {
  type    = bool
  default = false
}

variable "dotnet_version" {
  type        = string
  description = "(Optional) The version of .NET to use."
  default     = "v8.0"
}

variable "app_command_line" {
  type        = string
  default     = null
  description = "(Optional) The App command line to launch."
}

variable "connection_strings" {
  description = "Connection strings for App Service. See documentation"
  type        = list(map(string))
  default     = []
}

variable "enable_vnet_integration" {
  type        = bool
  description = "Enable integration with a virtual network"
  default     = false
}
variable "subnet_id" {
  type        = string
  description = "The ID of the subnet to connect to"
  default     = null
}

variable "staging_slot_enabled" {
  type        = bool
  description = "Create a staging slot alongside the App Service for blue/green deployment purposes. See [documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_slot)."
  default     = true
}

variable "staging_slot_custom_app_settings" {
  type        = map(string)
  description = "Override staging slot with custom app settings."
  default     = null
}

variable "site_config" {
  description = "Staging slot site config for App Service."
  type        = any
  default     = {}
  nullable    = false
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Enable public network access"
  default     = true
}

variable "id" {
  type        = string
  description = "(Required) The id of the function app to attach to"
}

variable "ip_restrictions" {
  description = "List of IP restrictions for the App Service"
  type = list(object({
    name                      = string
    priority                  = number
    action                    = string
    virtual_network_subnet_id = string
    ip_address                = string
    headers = optional(list(object({
      x_azure_fdid      = optional(list(string))
      x_fd_health_probe = optional(list(string))
      x_forwarded_for   = optional(list(string))
      x_forwarded_host  = optional(list(string))
    })), [])
  }))
  default = []
}

variable "ip_restriction_default_action" {
  type        = string
  description = "The default action"
  default     = "Allow"
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account"
  default     = null
}

variable "use_32_bit_worker" {
  type        = bool
  description = "(Optional) Should the Windows Function App Slot use a 32-bit worker process. Defaults to true. Set to false to use 64-bit."
  default     = true
}