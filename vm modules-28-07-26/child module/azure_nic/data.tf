# data "azurerm_public_ip" "pip" {
#     for_each = var.nics
#   name = each.value.pip_name
#   resource_group_name = each.value.resource_group_name
  
# }
data "azurerm_subnet" "jio-sub" {
    for_each = var.nics
  name = each.value.subnets_name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  
}