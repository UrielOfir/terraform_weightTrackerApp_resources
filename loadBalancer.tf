locals {
  instance_count = var.machinesAmmount
}

resource "azurerm_lb" "webApp" {
  name                = "${var.webAppPrefix}-lb"
  location            = var.location
  resource_group_name = azurerm_resource_group.vnet.name
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.LB-PIp.id
  }
}

resource "azurerm_lb_backend_address_pool" "webApp" {
  loadbalancer_id = azurerm_lb.webApp.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "LB-healthProbe" {
  resource_group_name = azurerm_resource_group.vnet.name
  loadbalancer_id     = azurerm_lb.webApp.id
  name                = "http-running-probe"
  port                = var.appPort
}

resource "azurerm_public_ip" "LB-PIp" {
  name                = "${var.webAppPrefix}-pip"
  resource_group_name = azurerm_resource_group.vnet.name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb_rule" "LB-rule" {
  resource_group_name            = azurerm_resource_group.vnet.name
  loadbalancer_id                = azurerm_lb.webApp.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = var.appPort
  backend_port                   = var.appPort
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.webApp.id]
  probe_id                       = azurerm_lb_probe.LB-healthProbe.id
}

resource "azurerm_network_interface_backend_address_pool_association" "LB" {
  count                   = local.instance_count
  backend_address_pool_id = azurerm_lb_backend_address_pool.webApp.id
  ip_configuration_name   = "primary"
  network_interface_id    = element(local.webAppInterface.*.id, count.index)
}

