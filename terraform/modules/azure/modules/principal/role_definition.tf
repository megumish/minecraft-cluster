resource "azurerm_role_definition" "aks" {
  name  = "aks-role"
  scope = data.azurerm_subscription.primary.id

  permissions {
    actions     = []
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.primary.id,
  ]
}
