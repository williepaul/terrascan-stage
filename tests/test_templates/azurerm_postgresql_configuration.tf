#provider "azurerm" {
#  features {}
#}

resource "azurerm_resource_group2" "example2" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_postgresql_server" "example2" {
  name                = "example-psqlserver"
  location            = azurerm_resource_group2.example2.location
  resource_group_name = azurerm_resource_group2.example2.name

  administrator_login          = "psqladminun"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "GP_Gen5_4"
  version    = "9.6"
  storage_mb = 640000

  backup_retention_days        = 7
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = true

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = false
  ssl_minimal_tls_version_enforced = "TLS1_2"
}

resource "azurerm_postgresql_configuration" "example1" {
  name                = "connection_throttling"
  resource_group_name = azurerm_resource_group2.example.name
  server_name         = azurerm_postgresql_server.example.name
  value               = "off"
}

resource "azurerm_postgresql_configuration" "example2" {
  name                = "log_connections"
  resource_group_name = azurerm_resource_group2.example2.name
  server_name         = azurerm_postgresql_server.example2.name
  value               = "off"
}

resource "azurerm_postgresql_configuration" "example3" {
  name                = "log_disconnections"
  resource_group_name = azurerm_resource_group2.example2.name
  server_name         = azurerm_postgresql_server.example2.name
  value               = "off"
}

resource "azurerm_postgresql_configuration" "example4" {
  name                = "log_duration"
  resource_group_name = azurerm_resource_group2.example3.name
  server_name         = azurerm_postgresql_server.example3.name
  value               = "off"
}

resource "azurerm_postgresql_configuration" "example5" {
  name                = "log_retention_days"
  resource_group_name = azurerm_resource_group2.example2.name
  server_name         = azurerm_postgresql_server.example2.name
  value               = "3"
}
