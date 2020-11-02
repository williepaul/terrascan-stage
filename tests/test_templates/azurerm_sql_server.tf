#provider "azurerm" {
#  features {}
#}

resource "azurerm_resource_group" "example6" {
  name     = "acceptanceTestResourceGroup1"
  location = "West US"
}

resource "azurerm_sql_server" "example6" {
  name                         = "mysqlserver"
  resource_group_name          = azurerm_resource_group.example6.name
  location                     = azurerm_resource_group.example6.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

data "azurerm_client_config" "current" {}

resource "azurerm_sql_active_directory_administrator" "example6" {
  server_name         = azurerm_sql_server.example6.name
  resource_group_name = azurerm_resource_group.example6.name
  login               = "sqladmin"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
}

resource "azurerm_sql_server" "predictable_login_server" {
  name                         = "sqlserver"
  resource_group_name          = azurerm_resource_group.example6.name
  location                     = azurerm_resource_group.example6.location
  version                      = "12.0"
  administrator_login          = "admin"
  administrator_login_password = "thisIsDog11"
}
