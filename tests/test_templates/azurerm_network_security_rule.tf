#provider "azurerm" {
#  features {}
#}

resource "azurerm_resource_group" "example_resource_group" {
  name     = "ExampleResourceGroup"
  location = "West US"
}

resource "azurerm_network_security_group" "example" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.example_resource_group.location
  resource_group_name = azurerm_resource_group.example_resource_group.name
}

resource "azurerm_network_security_rule" "openPublic9090w" {
    name                        = "open9090Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "9090"
    destination_port_range      = "9090"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic9090e" {
    name                        = "open9090Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "9090"
    destination_port_range      = "9090"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic3389w" {
    name                        = "open3389Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "3389"
    destination_port_range      = "3389"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic3389e" {
    name                        = "open3389Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "3389"
    destination_port_range      = "3389"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic22w" {
    name                        = "open22Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "22"
    destination_port_range      = "22"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic22e" {
    name                        = "open22Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "22"
    destination_port_range      = "22"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic3020s" {
    name                        = "open3020Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "3020"
    destination_port_range      = "3020"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic3020w" {
    name                        = "open3020Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "3020"
    destination_port_range      = "3020"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic3020e" {
    name                        = "open3020Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "3020"
    destination_port_range      = "3020"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate3020s" {
    name                        = "open3020Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "3020"
    destination_port_range      = "3020"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate3020w" {
    name                        = "open3020Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "3020"
    destination_port_range      = "3020"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic7001s" {
    name                        = "open7001Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "7001"
    destination_port_range      = "7001"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic7001w" {
    name                        = "open7001Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "7001"
    destination_port_range      = "7001"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic7001e" {
    name                        = "open7001Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "7001"
    destination_port_range      = "7001"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate7001s" {
    name                        = "open7001Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "7001"
    destination_port_range      = "7001"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate7001w" {
    name                        = "open7001Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "7001"
    destination_port_range      = "7001"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic61621s" {
    name                        = "open61621Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "61621"
    destination_port_range      = "61621"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic61621w" {
    name                        = "open61621Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "61621"
    destination_port_range      = "61621"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic61621e" {
    name                        = "open61621Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "61621"
    destination_port_range      = "61621"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate61621s" {
    name                        = "open61621Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "61621"
    destination_port_range      = "61621"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate61621w" {
    name                        = "open61621Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "61621"
    destination_port_range      = "61621"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic53sUdp" {
    name                        = "open53PublicsUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "53"
    destination_port_range      = "53"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic53wUdp" {
    name                        = "open53PublicwUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "53"
    destination_port_range      = "53"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic53eUdp" {
    name                        = "open53PubliceUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "53"
    destination_port_range      = "53"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate53sUdp" {
    name                        = "open53PrivatesUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "53"
    destination_port_range      = "53"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate53wUdp" {
    name                        = "open53PrivatewUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "53"
    destination_port_range      = "53"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic9000s" {
    name                        = "open9000Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "9000"
    destination_port_range      = "9000"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic9000w" {
    name                        = "open9000Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "9000"
    destination_port_range      = "9000"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic9000e" {
    name                        = "open9000Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "9000"
    destination_port_range      = "9000"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate9000s" {
    name                        = "open9000Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "9000"
    destination_port_range      = "9000"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate9000w" {
    name                        = "open9000Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "9000"
    destination_port_range      = "9000"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic8000s" {
    name                        = "open8000Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "8000"
    destination_port_range      = "8000"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic8000w" {
    name                        = "open8000Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "8000"
    destination_port_range      = "8000"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic8000e" {
    name                        = "open8000Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "8000"
    destination_port_range      = "8000"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate8000s" {
    name                        = "open8000Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "8000"
    destination_port_range      = "8000"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate8000w" {
    name                        = "open8000Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "8000"
    destination_port_range      = "8000"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic8080s" {
    name                        = "open8080Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "8080"
    destination_port_range      = "8080"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic8080w" {
    name                        = "open8080Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "8080"
    destination_port_range      = "8080"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic8080e" {
    name                        = "open8080Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "8080"
    destination_port_range      = "8080"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate8080s" {
    name                        = "open8080Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "8080"
    destination_port_range      = "8080"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate8080w" {
    name                        = "open8080Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "8080"
    destination_port_range      = "8080"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic636s" {
    name                        = "open636Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "636"
    destination_port_range      = "636"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic636w" {
    name                        = "open636Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "636"
    destination_port_range      = "636"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic636e" {
    name                        = "open636Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "636"
    destination_port_range      = "636"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate636s" {
    name                        = "open636Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "636"
    destination_port_range      = "636"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate636w" {
    name                        = "open636Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "636"
    destination_port_range      = "636"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic1434s" {
    name                        = "open1434Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "1434"
    destination_port_range      = "1434"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic1434w" {
    name                        = "open1434Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "1434"
    destination_port_range      = "1434"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic1434e" {
    name                        = "open1434Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "1434"
    destination_port_range      = "1434"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate1434s" {
    name                        = "open1434Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "1434"
    destination_port_range      = "1434"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate1434w" {
    name                        = "open1434Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "1434"
    destination_port_range      = "1434"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic1434sUdp" {
    name                        = "open1434PublicsUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "1434"
    destination_port_range      = "1434"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic1434wUdp" {
    name                        = "open1434PublicwUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "1434"
    destination_port_range      = "1434"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic1434eUdp" {
    name                        = "open1434PubliceUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "1434"
    destination_port_range      = "1434"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate1434sUdp" {
    name                        = "open1434PrivatesUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "1434"
    destination_port_range      = "1434"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate1434wUdp" {
    name                        = "open1434PrivatewUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "1434"
    destination_port_range      = "1434"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic135s" {
    name                        = "open135Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "135"
    destination_port_range      = "135"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic135w" {
    name                        = "open135Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "135"
    destination_port_range      = "135"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic135e" {
    name                        = "open135Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "135"
    destination_port_range      = "135"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate135s" {
    name                        = "open135Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "135"
    destination_port_range      = "135"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate135w" {
    name                        = "open135Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "135"
    destination_port_range      = "135"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic1433s" {
    name                        = "open1433Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "1433"
    destination_port_range      = "1433"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic1433w" {
    name                        = "open1433Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "1433"
    destination_port_range      = "1433"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic1433e" {
    name                        = "open1433Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "1433"
    destination_port_range      = "1433"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate1433s" {
    name                        = "open1433Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "1433"
    destination_port_range      = "1433"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate1433w" {
    name                        = "open1433Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "1433"
    destination_port_range      = "1433"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic11214s" {
    name                        = "open11214Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "11214"
    destination_port_range      = "11214"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic11214w" {
    name                        = "open11214Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "11214"
    destination_port_range      = "11214"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic11214e" {
    name                        = "open11214Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "11214"
    destination_port_range      = "11214"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate11214s" {
    name                        = "open11214Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "11214"
    destination_port_range      = "11214"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate11214w" {
    name                        = "open11214Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "11214"
    destination_port_range      = "11214"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic11215s" {
    name                        = "open11215Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "11215"
    destination_port_range      = "11215"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic11215w" {
    name                        = "open11215Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "11215"
    destination_port_range      = "11215"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic11215e" {
    name                        = "open11215Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "11215"
    destination_port_range      = "11215"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate11215s" {
    name                        = "open11215Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "11215"
    destination_port_range      = "11215"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate11215w" {
    name                        = "open11215Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "11215"
    destination_port_range      = "11215"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic11214sUdp" {
    name                        = "open11214PublicsUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "11214"
    destination_port_range      = "11214"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic11214wUdp" {
    name                        = "open11214PublicwUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "11214"
    destination_port_range      = "11214"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic11214eUdp" {
    name                        = "open11214PubliceUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "11214"
    destination_port_range      = "11214"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate11214sUdp" {
    name                        = "open11214PrivatesUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "11214"
    destination_port_range      = "11214"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate11214wUdp" {
    name                        = "open11214PrivatewUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "11214"
    destination_port_range      = "11214"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic11215sUdp" {
    name                        = "open11215PublicsUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "11215"
    destination_port_range      = "11215"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic11215wUdp" {
    name                        = "open11215PublicwUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "11215"
    destination_port_range      = "11215"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic11215eUdp" {
    name                        = "open11215PubliceUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "11215"
    destination_port_range      = "11215"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate11215sUdp" {
    name                        = "open11215PrivatesUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "11215"
    destination_port_range      = "11215"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate11215wUdp" {
    name                        = "open11215PrivatewUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "11215"
    destination_port_range      = "11215"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic445s" {
    name                        = "open445Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "445"
    destination_port_range      = "445"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic445w" {
    name                        = "open445Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "445"
    destination_port_range      = "445"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic445e" {
    name                        = "open445Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "445"
    destination_port_range      = "445"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate445s" {
    name                        = "open445Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "445"
    destination_port_range      = "445"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate445w" {
    name                        = "open445Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "445"
    destination_port_range      = "445"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic27018s" {
    name                        = "open27018Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "27018"
    destination_port_range      = "27018"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic27018w" {
    name                        = "open27018Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "27018"
    destination_port_range      = "27018"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic27018e" {
    name                        = "open27018Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "27018"
    destination_port_range      = "27018"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate27018s" {
    name                        = "open27018Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "27018"
    destination_port_range      = "27018"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate27018w" {
    name                        = "open27018Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "27018"
    destination_port_range      = "27018"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic3306s" {
    name                        = "open3306Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "3306"
    destination_port_range      = "3306"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic3306w" {
    name                        = "open3306Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "3306"
    destination_port_range      = "3306"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic3306e" {
    name                        = "open3306Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "3306"
    destination_port_range      = "3306"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate3306s" {
    name                        = "open3306Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "3306"
    destination_port_range      = "3306"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate3306w" {
    name                        = "open3306Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "3306"
    destination_port_range      = "3306"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic137s" {
    name                        = "open137Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "137"
    destination_port_range      = "137"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic137w" {
    name                        = "open137Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "137"
    destination_port_range      = "137"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic137e" {
    name                        = "open137Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "137"
    destination_port_range      = "137"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate137s" {
    name                        = "open137Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "137"
    destination_port_range      = "137"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate137w" {
    name                        = "open137Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "137"
    destination_port_range      = "137"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic137sUdp" {
    name                        = "open137PublicsUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "137"
    destination_port_range      = "137"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic137wUdp" {
    name                        = "open137PublicwUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "137"
    destination_port_range      = "137"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic137eUdp" {
    name                        = "open137PubliceUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "137"
    destination_port_range      = "137"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate137sUdp" {
    name                        = "open137PrivatesUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "137"
    destination_port_range      = "137"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate137wUdp" {
    name                        = "open137PrivatewUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "137"
    destination_port_range      = "137"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic138s" {
    name                        = "open138Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "138"
    destination_port_range      = "138"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic138w" {
    name                        = "open138Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "138"
    destination_port_range      = "138"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic138e" {
    name                        = "open138Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "138"
    destination_port_range      = "138"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate138s" {
    name                        = "open138Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "138"
    destination_port_range      = "138"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate138w" {
    name                        = "open138Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "138"
    destination_port_range      = "138"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic138sUdp" {
    name                        = "open138PublicsUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "138"
    destination_port_range      = "138"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic138wUdp" {
    name                        = "open138PublicwUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "138"
    destination_port_range      = "138"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic138eUdp" {
    name                        = "open138PubliceUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "138"
    destination_port_range      = "138"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate138sUdp" {
    name                        = "open138PrivatesUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "138"
    destination_port_range      = "138"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate138wUdp" {
    name                        = "open138PrivatewUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "138"
    destination_port_range      = "138"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic139s" {
    name                        = "open139Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "139"
    destination_port_range      = "139"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic139w" {
    name                        = "open139Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "139"
    destination_port_range      = "139"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic139e" {
    name                        = "open139Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "139"
    destination_port_range      = "139"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate139s" {
    name                        = "open139Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "139"
    destination_port_range      = "139"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate139w" {
    name                        = "open139Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "139"
    destination_port_range      = "139"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic139sUdp" {
    name                        = "open139PublicsUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "139"
    destination_port_range      = "139"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic139wUdp" {
    name                        = "open139PublicwUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "139"
    destination_port_range      = "139"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic139eUdp" {
    name                        = "open139PubliceUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "139"
    destination_port_range      = "139"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate139sUdp" {
    name                        = "open139PrivatesUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "139"
    destination_port_range      = "139"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate139wUdp" {
    name                        = "open139PrivatewUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "139"
    destination_port_range      = "139"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic2484s" {
    name                        = "open2484Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "2484"
    destination_port_range      = "2484"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic2484w" {
    name                        = "open2484Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "2484"
    destination_port_range      = "2484"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic2484e" {
    name                        = "open2484Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "2484"
    destination_port_range      = "2484"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate2484s" {
    name                        = "open2484Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "2484"
    destination_port_range      = "2484"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate2484w" {
    name                        = "open2484Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "2484"
    destination_port_range      = "2484"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic2484sUdp" {
    name                        = "open2484PublicsUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "2484"
    destination_port_range      = "2484"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic2484wUdp" {
    name                        = "open2484PublicwUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "2484"
    destination_port_range      = "2484"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic2484eUdp" {
    name                        = "open2484PubliceUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "2484"
    destination_port_range      = "2484"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate2484sUdp" {
    name                        = "open2484PrivatesUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "2484"
    destination_port_range      = "2484"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate2484wUdp" {
    name                        = "open2484PrivatewUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "2484"
    destination_port_range      = "2484"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic110s" {
    name                        = "open110Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "110"
    destination_port_range      = "110"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic110w" {
    name                        = "open110Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "110"
    destination_port_range      = "110"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic110e" {
    name                        = "open110Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "110"
    destination_port_range      = "110"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate110s" {
    name                        = "open110Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "110"
    destination_port_range      = "110"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate110w" {
    name                        = "open110Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "110"
    destination_port_range      = "110"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic5432s" {
    name                        = "open5432Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "5432"
    destination_port_range      = "5432"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic5432w" {
    name                        = "open5432Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "5432"
    destination_port_range      = "5432"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic5432e" {
    name                        = "open5432Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "5432"
    destination_port_range      = "5432"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate5432s" {
    name                        = "open5432Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "5432"
    destination_port_range      = "5432"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate5432w" {
    name                        = "open5432Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "5432"
    destination_port_range      = "5432"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic5432sUdp" {
    name                        = "open5432PublicsUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "5432"
    destination_port_range      = "5432"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic5432wUdp" {
    name                        = "open5432PublicwUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "5432"
    destination_port_range      = "5432"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic5432eUdp" {
    name                        = "open5432PubliceUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "5432"
    destination_port_range      = "5432"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate5432sUdp" {
    name                        = "open5432PrivatesUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "5432"
    destination_port_range      = "5432"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate5432wUdp" {
    name                        = "open5432PrivatewUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "5432"
    destination_port_range      = "5432"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic3000s" {
    name                        = "open3000Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "3000"
    destination_port_range      = "3000"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic3000w" {
    name                        = "open3000Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "3000"
    destination_port_range      = "3000"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic3000e" {
    name                        = "open3000Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "3000"
    destination_port_range      = "3000"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate3000s" {
    name                        = "open3000Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "3000"
    destination_port_range      = "3000"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate3000w" {
    name                        = "open3000Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "3000"
    destination_port_range      = "3000"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic8140s" {
    name                        = "open8140Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "8140"
    destination_port_range      = "8140"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic8140w" {
    name                        = "open8140Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "8140"
    destination_port_range      = "8140"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic8140e" {
    name                        = "open8140Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "8140"
    destination_port_range      = "8140"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate8140s" {
    name                        = "open8140Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "8140"
    destination_port_range      = "8140"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate8140w" {
    name                        = "open8140Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "8140"
    destination_port_range      = "8140"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic25s" {
    name                        = "open25Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "25"
    destination_port_range      = "25"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic25w" {
    name                        = "open25Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "25"
    destination_port_range      = "25"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic25e" {
    name                        = "open25Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "25"
    destination_port_range      = "25"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate25s" {
    name                        = "open25Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "25"
    destination_port_range      = "25"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate25w" {
    name                        = "open25Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "25"
    destination_port_range      = "25"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic161sUdp" {
    name                        = "open161PublicsUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "161"
    destination_port_range      = "161"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic161wUdp" {
    name                        = "open161PublicwUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "161"
    destination_port_range      = "161"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic161eUdp" {
    name                        = "open161PubliceUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "161"
    destination_port_range      = "161"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate161sUdp" {
    name                        = "open161PrivatesUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "161"
    destination_port_range      = "161"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate161wUdp" {
    name                        = "open161PrivatewUdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Udp"
    source_port_range           = "161"
    destination_port_range      = "161"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic2382s" {
    name                        = "open2382Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "2382"
    destination_port_range      = "2382"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic2382w" {
    name                        = "open2382Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "2382"
    destination_port_range      = "2382"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic2382e" {
    name                        = "open2382Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "2382"
    destination_port_range      = "2382"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate2382s" {
    name                        = "open2382Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "2382"
    destination_port_range      = "2382"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate2382w" {
    name                        = "open2382Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "2382"
    destination_port_range      = "2382"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic2383s" {
    name                        = "open2383Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "2383"
    destination_port_range      = "2383"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic2383w" {
    name                        = "open2383Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "2383"
    destination_port_range      = "2383"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic2383e" {
    name                        = "open2383Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "2383"
    destination_port_range      = "2383"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate2383s" {
    name                        = "open2383Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "2383"
    destination_port_range      = "2383"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate2383w" {
    name                        = "open2383Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "2383"
    destination_port_range      = "2383"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic4505s" {
    name                        = "open4505Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "4505"
    destination_port_range      = "4505"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic4505w" {
    name                        = "open4505Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "4505"
    destination_port_range      = "4505"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic4505e" {
    name                        = "open4505Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "4505"
    destination_port_range      = "4505"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate4505s" {
    name                        = "open4505Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "4505"
    destination_port_range      = "4505"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate4505w" {
    name                        = "open4505Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "4505"
    destination_port_range      = "4505"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic4506s" {
    name                        = "open4506Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "4506"
    destination_port_range      = "4506"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic4506w" {
    name                        = "open4506Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "4506"
    destination_port_range      = "4506"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic4506e" {
    name                        = "open4506Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "4506"
    destination_port_range      = "4506"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate4506s" {
    name                        = "open4506Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "4506"
    destination_port_range      = "4506"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate4506w" {
    name                        = "open4506Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "4506"
    destination_port_range      = "4506"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic23s" {
    name                        = "open23Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "23"
    destination_port_range      = "23"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic23w" {
    name                        = "open23Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "23"
    destination_port_range      = "23"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic23e" {
    name                        = "open23Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "23"
    destination_port_range      = "23"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate23s" {
    name                        = "open23Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "23"
    destination_port_range      = "23"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate23w" {
    name                        = "open23Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "23"
    destination_port_range      = "23"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic5500s" {
    name                        = "open5500Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "5500"
    destination_port_range      = "5500"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic5500w" {
    name                        = "open5500Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "5500"
    destination_port_range      = "5500"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic5500e" {
    name                        = "open5500Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "5500"
    destination_port_range      = "5500"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate5500s" {
    name                        = "open5500Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "5500"
    destination_port_range      = "5500"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate5500w" {
    name                        = "open5500Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "5500"
    destination_port_range      = "5500"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic5900s" {
    name                        = "open5900Publics"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "5900"
    destination_port_range      = "5900"
    source_address_prefix       = "192.164.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic5900w" {
    name                        = "open5900Publicw"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "5900"
    destination_port_range      = "5900"
    source_address_prefix       = "192.164.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPublic5900e" {
    name                        = "open5900Publice"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "5900"
    destination_port_range      = "5900"
    source_address_prefix       = "0.0.0.0/0"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate5900s" {
    name                        = "open5900Privates"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "5900"
    destination_port_range      = "5900"
    source_address_prefix       = "10.0.0.0/28"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "openPrivate5900w" {
    name                        = "open5900Privatew"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "5900"
    destination_port_range      = "5900"
    source_address_prefix       = "10.0.0.0/23"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.example_resource_group.name
    network_security_group_name = azurerm_network_security_group.example.name
}
