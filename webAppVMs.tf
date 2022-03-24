resource "azurerm_resource_group" "webApp" {
  name     = "${var.webAppPrefix}-resources"
  location = var.location
}

locals {
  instance_count = 2
}

resource "azurerm_network_interface" "webApp" {
  count               = local.instance_count
  name                = "${var.webAppPrefix}-nic${count.index}"
  resource_group_name = azurerm_resource_group.webApp.name
  location            = var.location

  ip_configuration {
    name                          = "primary"
    subnet_id                     = azurerm_subnet.webApp.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_availability_set" "avset" {
  name                         = "${var.webAppPrefix}avset"
  location                     = var.location
  resource_group_name          = azurerm_resource_group.webApp.name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true
}


resource "azurerm_linux_virtual_machine" "webApp" {
  count                           = local.instance_count
  name                            = "${var.webAppPrefix}-vm${count.index}"
  resource_group_name             = azurerm_resource_group.webApp.name
  location                        = var.location
  size                            = "Standard_b1ls"
  admin_username                  = var.webAppVMUserName
  admin_password                  = var.webAppVMPassword
  availability_set_id             = azurerm_availability_set.avset.id
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.webApp[count.index].id,
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}

