# terraform {
#   backend "azurerm" {
#     resource_group_name  = "backendState"
#     storage_account_name = "backendstatewt12"
#     container_name       = "backendstate"
#     key                  = "prod.terraform.tfstate"
#   }
# }