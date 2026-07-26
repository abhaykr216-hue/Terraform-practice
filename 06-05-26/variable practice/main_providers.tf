terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.72.0"
    }
  }
   backend "azurerm" {
    use_cli              = true                                    # Can also be set via `ARM_USE_CLI` environment variable.
    use_azuread_auth     = true                                    # Can also be set via `ARM_USE_AZUREAD` environment variable.
    tenant_id            = "e34729cb-cf15-4db6-8085-4bc2ea2ff4d3"  # Can also be set via `ARM_TENANT_ID` environment variable. Azure CLI will fallback to use the connected tenant ID if not supplied.
    storage_account_name = "komalstr123"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "variablestr123"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "abhaykr.terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

provider "azurerm" {
    features {
      
    }
  
}
