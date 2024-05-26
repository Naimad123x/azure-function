variable "resource_group_name" {
  type    = string
  default = "example-group"
}

variable "location" {
  type    = string
  default = "Poland Central"
}

variable "storage_account_name" {
  type    = string
  default = "examplesa"
}

variable "storage_account_tier" {
  type    = string
  default = "Standard"
}

variable "storage_account_replication_type" {
  type    = string
  default = "LRS"
}

variable "service_plan_name" {
  type    = string
  default = "example-service-plan"
}

variable "service_plan_sku" {
  type    = string
  default = "S1"
}

variable "os_type" {
  type    = string
  default = "Linux"
}

variable "function_app_name" {
  type    = string
  default = "example-function-app"
}

variable "python_version" {
  type    = string
  default = "3.9"
}

variable "function_app_function_name" {
  type    = string
  default = "example-function-app-function"
}
