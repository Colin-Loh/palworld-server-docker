terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.28.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "711bd46e-10e1-4db1-a885-1793f3ae6f13"
}
