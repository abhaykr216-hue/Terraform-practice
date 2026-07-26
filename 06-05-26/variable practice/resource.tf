resource "azurerm_resource_group" "rg1" {
  name = var.x
  location = "eastus" 
}
resource "azurerm_storage_account" "st12" {
  name = "pkmstr2222"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  
}