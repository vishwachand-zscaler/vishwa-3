resource "azurerm_network_security_group" "example_30" {
  name                = "acceptanceTestSecurityGroup"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "TCP"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "0.0.0.0"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}
