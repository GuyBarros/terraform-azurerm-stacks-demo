
# Data source to get the current subscription ID and tenant ID
data "azurerm_subscription" "primary" {}

data "azurerm_client_config" "vault_platform_team" {}

# Define resource groups using dynamic for_each loop with toset conversion
resource "azurerm_resource_group" "vault_platform_team_rg" {
  name     = var.resource_group_name
  location = var.location
}

