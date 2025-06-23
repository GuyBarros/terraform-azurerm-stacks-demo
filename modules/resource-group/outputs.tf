output "resource_group" {
  description = "Deployment Azure resource group"
  value = {
    id       = azurerm_resource_group.deployment_rg.id
    name     = azurerm_resource_group.deployment_rg.name
    location = azurerm_resource_group.deployment_rg.location
  }
}
