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
  default     = "Deny"
}

variable "sa_replication_type" {
  default = "ZRS"
}