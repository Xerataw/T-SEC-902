terraform {
  required_providers {
    ansible = {
      version = "~> 1.3.0"
      source  = "ansible/ansible"
    }
  }
    #backend "azurerm" {
    #resource_group_name  = "StorageAccount-ResourceGroup"
    #storage_account_name = "abcd1234"
    #container_name       = "tfstate"
    #key                  = "prod.terraform.tfstate"
    #use_azuread_auth     = true
  #}
}

provider "azurerm" {
  features {}
  subscription_id = "0f702af7-d148-47ad-aa75-f92d5ac76faa"
}