resource "azurerm_postgresql_configuration" "example00012" {
  name                = "log_connections"
  resource_group_name = azurerm_resource_group.example00012.name
  server_name         = azurerm_postgresql_server.example00012.name
  value               = "off"
}
