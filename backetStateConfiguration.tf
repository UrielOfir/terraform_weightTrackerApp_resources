terraform {
  backend "azurerm" {
    resource_group_name  = "backendState"
    storage_account_name = "backendstatewt"
    container_name       = "backendstate"
    key                  = "prod.terraform.tfstate"
  }
}