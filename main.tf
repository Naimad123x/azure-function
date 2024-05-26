resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

resource "azurerm_service_plan" "example" {
  name                = var.service_plan_name
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = var.os_type
  sku_name            = var.service_plan_sku
}

resource "azurerm_linux_function_app" "example" {
  name                = var.function_app_name
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
  service_plan_id     = azurerm_service_plan.example.id

  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key

  site_config {
    application_stack {
      python_version = var.python_version
    }
  }
}

resource "azurerm_function_app_function" "example" {
  name            = var.function_app_function_name
  function_app_id = azurerm_linux_function_app.example.id
  language        = "Python"
  
  test_data = jsonencode({
    "name" = "Azure"
  })
  config_json = jsonencode({
    "bindings" = [
      {
        "authLevel" = "function"
        "direction" = "in"
        "methods" = [
          "get",
          "post",
        ]
        "name" = "req"
        "type" = "httpTrigger"
      },
      {
        "direction" = "out"
        "name"      = "$return"
        "type"      = "http"
      },
    ]
  })
}
