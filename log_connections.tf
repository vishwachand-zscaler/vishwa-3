resource "azurerm_postgresql_configuration" "example3" {
  name                = "log_connections"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_postgresql_server.example.name
  value               = "off"
}
