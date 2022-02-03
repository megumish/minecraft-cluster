resource "azurerm_role_assignment" "aks" {
  scope              = data.azurerm_subscription.primary.id
  role_definition_id = azurerm_role_definition.aks.role_definition_resource_id
  principal_id       = data.azurerm_client_config.current.object_id
}
