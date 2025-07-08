terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.24.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
   alias = "Ketu"
}

provider "azurerm" {
  # Configuration options
  features {}
  alias = "Rahu"
}