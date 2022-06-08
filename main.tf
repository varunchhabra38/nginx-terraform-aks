terraform {
  required_version = ">= 0.13"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.9.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  
 }
    backend azurerm {
    resource_group_name   = "terraform-state-storage-rg"
    storage_account_name  = "terraformstat1233dsa"
    container_name        = "tfstatefiles"
    key                   = "terraform.tfstate"
    }


}

provider "azurerm" {
  features {

  }
}

resource "random_pet" "aksrandom" {

}

