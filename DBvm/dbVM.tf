resource "azurerm_resource_group" "DB" {
  name     = "${var.DBPrefix}-resources"
  location = var.location
}

resource "azurerm_network_interface" "DB" {
  name                = "nicDB"
  resource_group_name = azurerm_resource_group.DB.name
  location            = var.location

  ip_configuration {
    name                          = "primary"
    subnet_id                     =  var.subnetId
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "DB-VM" {
  name                            = "${var.DBPrefix}-VM"
  resource_group_name             = azurerm_resource_group.DB.name
  location                        = var.location
  size                            = "Standard_b1ls"
  admin_username                  = var.DB-VMUserName
  admin_password                  = var.DB-VMPassword
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.DB.id]

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
