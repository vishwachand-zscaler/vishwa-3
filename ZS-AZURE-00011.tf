resource "azurerm_resource_group" "example-11" {
  name     = "api-rg-pro"
  location = "West Europe"
}

resource "azurerm_postgresql_configuration" "example-11" {
  name                = "log_checkpoints"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_postgresql_server.example.name
  value               = "off"
}
