terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}
provider "azurerm" {
  features {}
    subscription_id = "bcda3c71-6a15-46f1-9c5c-8d139a62328d"
    client_id       = "969689bf-9a51-4cd7-91db-811e5e02046e"
  client_secret   = "36l8Q~5nsi.FQSd7BaWMAxWF59RWfbwu~OLuvcvm"
  tenant_id       = "fb33739e-3f45-442f-86c4-cd0a4366ebd1"
}
resource "azurerm_resource_group" "terraform_test" {
  name = "terraform"
  location = "eastus"
}

resource "azurerm_storage_account" "sample_storage" {
  name                     = "terraformstorage7478"
  resource_group_name      = azurerm_resource_group.terraform_test.name
  location                 = azurerm_resource_group.terraform_test.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "blob" {
  name                  = "terraform"
  storage_account_name  = azurerm_storage_account.sample_storage.name
  container_access_type = "private"
}

