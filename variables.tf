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
}

variable "os_type" {
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

variable "allow_nested_items_to_be_public" {
  type        = bool
  description = "(Optional) Allow or disallow nested items within this Account to opt into being public"
  default     = false
}

variable "default_action" {
  type        = string
  description = "(Optional) Network rules default action"
  default     = "Allow"
}

variable "sa_replication_type" {
  type    = string
  default = "ZRS"
}

variable "dotnet_version" {
  type        = string
  description = "(Optional) The version of .NET to use."
  default     = "v8.0"
}

variable "use_dotnet_isolated_runtime" {
  type        = bool
  description = "(Optional) Should the DotNet process use an isolated runtime. Defaults to false."
  default     = true
}

variable "app_scale_limit" {
  type        = number
  description = "(Optional) The number of workers this function app can scale out to."
  default     = 200
}

variable "dotnet_stack" {
  type    = bool
  default = false
}

variable "java_stack" {
  type    = bool
  default = false
}

variable "node_stack" {
  type    = bool
  default = false
}

variable "java_version" {
  type        = string
  description = "(Optional) The version of Java to use."
  default     = "17"
}

variable "node_version" {
  type        = string
  description = "(Optional) The version of Node to run."
  default     = "20"
}

variable "ftps_state" {
  type        = string
  description = "(Optional) State of FTP / FTPS service for this Windows Function App."
  default     = null
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

variable "public_network_access_enabled" {
  type        = bool
  description = "Enable public network access"
  default     = true
}

# variable "staging_slot_enabled" {
#   description = "Create a staging slot alongside the Function App for blue/green deployment purposes."
#   type        = bool
#   default     = false
# }

variable "connection_strings" {
  description = "List of connection strings for the application"
  type = list(object({
    name  = string
    type  = string
    value = string
  }))

  default = []
}