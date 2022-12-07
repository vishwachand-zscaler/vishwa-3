resource "azurerm_app_service" "remediation_example_1" {
    name                = "example-app-service"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    app_service_plan_id = azurerm_app_service_plan.example.id
    client_cert_enabled = false
}
