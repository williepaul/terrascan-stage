#provider "azurerm" {
#  features {}
#}

resource "azurerm_resource_group" "rg_details" {
  name     = "acceptanceTestResourceGroup1"
  location = "West US"
}

resource "azurerm_sql_server" "sqlserver_details" {
  name                         = "mysqlserver"
  resource_group_name          = azurerm_resource_group.rg_details.name
  location                     = "West US"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_sql_firewall_rule" "checkPublicAccessNotAllow" {
  name                = "FirewallRule1"
  resource_group_name = azurerm_resource_group.rg_details.name
  server_name         = azurerm_sql_server.sqlserver_details.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_sql_firewall_rule" "pubIngress" {
  name                = "pubIngress"
  resource_group_name = azurerm_resource_group.rg_details.name
  server_name         = azurerm_sql_server.sqlserver_details.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}

resource "azurerm_sql_firewall_rule" "moreHostsAllowed" {
  name                = "moreHostsAllowed"
  resource_group_name = azurerm_resource_group.rg_details.name
  server_name         = azurerm_sql_server.sqlserver_details.name
  start_ip_address    = "10.0.1.25"
  end_ip_address      = "10.1.0.17"
}
