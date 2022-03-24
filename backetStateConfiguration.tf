# resource "azurerm_resource_group" "backendState" {
#   name     = "backendState"
#   location = var.location
# }

# resource "azurerm_storage_account" "backendState" {
#   name                     = "backendstatewt12"
#   resource_group_name      = azurerm_resource_group.backendState.name
#   location                 = azurerm_resource_group.backendState.location
#   account_tier             = "Standard"
#   account_replication_type = "GRS"

#   tags = {
#     environment = "staging"
#   }
# }

# resource "azurerm_storage_container" "backendState" {
#   name                  = "backendstate"
#   storage_account_name  = azurerm_storage_account.backendState.name
#   container_access_type = "private"
# }

# terraform {
#   backend "azurerm" {
#     resource_group_name  = "backendState"
#     storage_account_name = "backendstatewt12"
#     container_name       = "backendstate"
#     key                  = "prod.terraform.tfstate"
#   }
# }