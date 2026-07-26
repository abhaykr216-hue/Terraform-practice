terraform {
backend "azurerm" {
  resource_group_name = "koma12"
  storage_account_name = "komalstr123"
  container_name = "variablestr123"
  key = "prod2.terraform.tfstate"
}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.68.0"
    }
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "abh" {
  name     = "x"
  location = "West Europe"
}
resource "azurerm_storage_account""abhstr"{
  name = "abha21str"
  resource_group_name = azurerm_resource_group.abh.name
  location = azurerm_resource_group.abh.location
  account_tier = "Standard"
  account_replication_type = "GRS"
}