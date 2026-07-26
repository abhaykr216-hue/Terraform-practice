terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-satatic-app-terra"
  location = "east us"
}

# Storage Account (latest best practices)
resource "azurerm_storage_account" "storage" {
  name                     = "abhaystorage1235" # must be globally unique
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version          = "TLS1_2"
  allow_nested_items_to_be_public = true
}

# Static Website
resource "azurerm_storage_account_static_website" "static" {
  storage_account_id = azurerm_storage_account.storage.id

  index_document     = "index.html"
  error_404_document = "404.html"
}

# Upload full folder (latest approach)
# resource "azurerm_storage_blob" "website_files" {
#   for_each = fileset("C:/Users/Abhay Kumar/Desktop/StreamFlix-build/StreamFlix-build", "**")

#   name                   = each.value
#   storage_account_name   = azurerm_storage_account.storage.name
#   storage_container_name = "$web"
#   type                   = "Block"

#   source = "C:/Users/Abhay Kumar/Desktop/StreamFlix-build/StreamFlix-build/${each.value}"

#   content_type = lookup(
#     {
#       html = "text/html"
#       css  = "text/css"
#       js   = "application/javascript"
#       json = "application/json"
#       png  = "image/png"
#       jpg  = "image/jpeg"
#       jpeg = "image/jpeg"
#       gif  = "image/gif"
#       svg  = "image/svg+xml"
#       ico  = "image/x-icon"
#     },
#     lower(element(split(".", each.value), length(split(".", each.value)) - 1)),
#     "application/octet-stream"
#   )

#   depends_on = [
#     azurerm_storage_account_static_website.static
#   ]
# }