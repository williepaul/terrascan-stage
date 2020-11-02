#provider "azurerm" {
#  features {}
#}

resource "azurerm_resource_group" "example5" {
  name     = "example-resources"
  location = "West Europe"
}

# NOTE: the Name used for Redis needs to be globally unique
resource "azurerm_redis_cache" "nonSslEnable" {
  name                = "example-cache"
  location            = azurerm_resource_group.example5.location
  resource_group_name = azurerm_resource_group.example5.name
  capacity            = 2
  family              = "C"
  sku_name            = "Standard"
  enable_non_ssl_port = true
  minimum_tls_version = "1.2"

  redis_configuration {
  }

  patch_schedule {
    day_of_week = "Sunday"
    start_hour_utc = 0
  }
}

# NOTE: the Name used for Redis needs to be globally unique
resource "azurerm_redis_cache" "NoPatchSchedule" {
  name                = "example-cache"
  location            = azurerm_resource_group.example5.location
  resource_group_name = azurerm_resource_group.example5.name
  capacity            = 2
  family              = "C"
  sku_name            = "Standard"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"

  redis_configuration {
  }
}

resource "azurerm_redis_firewall_rule" "publiclyAccessible" {
  name                = "publiclyAccessible"
  redis_cache_name    = azurerm_redis_cache.nonSslEnable.name
  resource_group_name = azurerm_resource_group.example5.name
  start_ip            = "0.0.0.0"
  end_ip              = "0.0.0.0"
}

resource "azurerm_redis_firewall_rule" "publicIpAccess" {
  name                = "publicIpAccess"
  redis_cache_name    = azurerm_redis_cache.nonSslEnable.name
  resource_group_name = azurerm_resource_group.example5.name
  start_ip            = "11.1.2.130"
  end_ip              = "11.1.2.240"
}

resource "azurerm_redis_firewall_rule" "allowLessHosts" {
  name                = "allowLessHosts"
  redis_cache_name    = azurerm_redis_cache.nonSslEnable.name
  resource_group_name = azurerm_resource_group.example5.name
  start_ip    = "10.0.1.25"
  end_ip      = "10.1.0.17"
}
