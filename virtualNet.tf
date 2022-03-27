resource "azurerm_resource_group" "vnet" {
  name     = "${var.vnetPrefix}-resources"
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnetPrefix
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.vnet.name
}

# the web-app subnet resources

resource "azurerm_subnet" "webApp" {
  name                 = "webAppNet"
  resource_group_name  = azurerm_resource_group.vnet.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_security_group" "webApp" {
  name                = "${var.webAppPrefix}-NSG"
  location            = var.location
  resource_group_name = azurerm_resource_group.vnet.name
  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "port${var.appPort}"
    priority                   = 100
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = var.appPort
    destination_address_prefix = azurerm_subnet.webApp.address_prefix
  }
}

resource "azurerm_subnet_network_security_group_association" "webApp" {
  subnet_id                 = azurerm_subnet.webApp.id
  network_security_group_id = azurerm_network_security_group.webApp.id
}

# the DB subnet resources

resource "azurerm_subnet" "DB" {
  name                 = "DBVnet"
  resource_group_name  = azurerm_resource_group.vnet.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.4.0/24"]
}

resource "azurerm_network_security_group" "DBNsg" {
  name                = "DBNsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.vnet.name
}


resource "azurerm_subnet_network_security_group_association" "DB" {
  subnet_id                 = azurerm_subnet.DB.id
  network_security_group_id = azurerm_network_security_group.DBNsg.id
}