data "azurerm_resource_group" "example" {
  name     = "az204webapp5454_group"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}
