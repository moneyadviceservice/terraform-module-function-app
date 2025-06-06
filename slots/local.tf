locals {
  storage_account_name = replace(replace("${var.name}${var.env}", "func-", ""), "-", "")
}