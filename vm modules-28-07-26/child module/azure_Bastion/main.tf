resource "azurerm_bastion_host" "bast" {
  for_each = var.bastion
  name = each.value.name 
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
     name                 = "bas_config"
    subnet_id            = data.azurerm_subnet.subnets[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}