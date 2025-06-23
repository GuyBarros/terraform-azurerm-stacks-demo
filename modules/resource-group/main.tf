
# Data source to get the current subscription ID and tenant ID
data "azurerm_subscription" "primary" {}


# Define resource groups using dynamic for_each loop with toset conversion
resource "azurerm_resource_group" "deployment_rg" {
  name     = var.resource_group_name
  location = var.location
}

