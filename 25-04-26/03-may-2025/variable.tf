terraform {
  backend "azurerm" {
    use_cli              = true                                    # Can also be set via `ARM_USE_CLI` environment variable.
    use_azuread_auth     = true                                    # Can also be set via `ARM_USE_AZUREAD` environment variable.
    tenant_id            = "e34729cb-cf15-4db6-8085-4bc2ea2ff4d3"  # Can also be set via `ARM_TENANT_ID` environment variable. Azure CLI will fallback to use the connected tenant ID if not supplied.
    storage_account_name = "komalstr123"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "variablestr123"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prod21.terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {
    
  }
}
# variable "x" {
  
# }
resource "azurerm_resource_group" "rg1" {
  name     = var.x
  location = "West Europe"
}

# resource "azurerm_storage_account" "astr2" {
#   name                     = "akstr21"
#   resource_group_name      = azurerm_resource_group.a2.name
#   location                 = azurerm_resource_group.a2.location
#   account_tier             = "Standard"
#   account_replication_type = "GRS"

#   tags = {
#     environment = "staging"
#   }
# }