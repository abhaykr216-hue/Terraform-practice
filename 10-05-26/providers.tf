terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.72.0"
    }

  }
  backend "azurerm" {
   resource_group_name = "rg-abhay"
    storage_account_name = "tfstatestorage1405"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "sandeep16may"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "abhay.terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}


provider "azurerm" {
  features {}

}

