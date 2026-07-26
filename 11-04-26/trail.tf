terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.68.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}
resource "azurerm_resource_group" "km" {
  name     = "koma12"
  location = "West Europe"
}

resource "azurerm_resource_group" "kom1" {
  name     = "komalyes23"
  location = "West Europe"
}

resource "azurerm_resource_group" "ko2" {
  name     = "komal1234"
  location = "West Europe"
}

resource "azurerm_resource_group" "kom3" {
  name     = "komal12345"
  location = "West Europe"
}