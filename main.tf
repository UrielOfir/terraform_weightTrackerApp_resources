module "DBvm" {
    source = "./DBvm"
    location = var.location
    DBPrefix = var.DBPrefix
    subnetId = azurerm_subnet.DB.id
    DB-VMUserName= var.DB-VMUserName
    DB-VMPassword= var.DB-VMPassword
}