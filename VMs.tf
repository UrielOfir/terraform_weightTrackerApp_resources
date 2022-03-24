module "DBvm" {
  source        = "./VMs/DBvm"
  location      = var.location
  DBPrefix      = var.DBPrefix
  subnetId      = azurerm_subnet.DB.id
  DB-VMUserName = var.DB-VMUserName
  DB-VMPassword = var.DB-VMPassword
}

module "webAppVMs" {
  source           = "./VMs/webAppVMs"
  location         = var.location
  webAppPrefix     = var.webAppPrefix
  subnetId         = azurerm_subnet.webApp.id
  webAppVMUserName = var.webAppVMUserName
  webAppVMPassword = var.webAppVMPassword
  machinesAmmount  = var.machinesAmmount
}

locals {
 webAppInterface = module.webAppVMs.interface
}