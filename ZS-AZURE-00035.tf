resource "azurerm_2_resource_group_2" "example20" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_2_storage_account_2" "example" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  enable_https_traffic_only = false

  tags = {
    environment = "staging"
  }
}
