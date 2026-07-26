resource "azurerm_network_interface" "nic" {
  for_each = var.nics
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name = each.value.ipconfig_name
    private_ip_address_allocation = "Dynamic"
    subnet_id = data.azurerm_subnet.jio-sub[each.key].id
    # public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}
resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.nics
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.vm-size
  admin_username      = each.value.admin-username
  admin_password = each.value.admin-password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
  publisher = "Canonical"
  offer      = "ubuntu-24_04-lts"
  sku         = "server"
  version     = "latest"
}
}
