terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }

  cloud {
    organization = "EVF_Consulting"
    workspaces {
      name = "TerraformCI_Test"
    }
  }
}

provider "azurerm" {
  features {}
  # skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-ci"
  location = "UK South"
}

resource "azurerm_storage_account" "sa" {
  name                     = "evf001terraformci"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
