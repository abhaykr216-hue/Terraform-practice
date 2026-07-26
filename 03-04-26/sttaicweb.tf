terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.67.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}
resource "azurerm_resource_group" "rg1" {
  name     = "abhaystaticedd"
  location = "West us"
}
# Storage Account (latest best practices)
resource "azurerm_storage_account" "stor" {
  name                = "abhaystorage235" # must be globally unique
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = true
}

# Static Website
resource "azurerm_storage_account_static_website" "static" {
  storage_account_id = azurerm_storage_account.stor.id

  index_document     = "index.html"
  error_404_document = "404.html"
}