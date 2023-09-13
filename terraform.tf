	terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.6.0"
    }
    }
}
provider "azurerm" {
  features {}

  subscription_id = "7e3cd86c-691b-4f27-83e2-72c4d63a5736"
  client_id       = "75e37be0-97f6-4e45-8d40-a4db485b66"
  client_secret   = "QvE8Q~.buQwrPNXWE3r2e2Xf-oUikpHSkDNVVc"
  tenant_id       = "5c4c3ab4-7994-41c2-bf07-3b972c97d84c"
}
data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
