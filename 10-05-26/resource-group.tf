



resource "azurerm_resource_group" "cl1" {
   for_each = toset([ "amito","amit","am","ami" ])#    for_each = toset(["eastus","eastus","eastus"])
   name = each.value 
  location = "eastus"
}

