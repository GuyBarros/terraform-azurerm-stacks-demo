

data "tfe_project" "tfstacks_project" {
  name         = var.tfc_project
  organization = var.tfc_organization
}

resource "tfe_variable_set" "azure_varset" {
  name         = "Azure Auto Varset"
  description  = "This variable set is used to manage Azure credentials for Terraform Stacks runs."
  organization = var.tfc_organization
}

resource "tfe_project_variable_set" "tfstacks_project_varset" {
  project_id      = data.tfe_project.tfstacks_project.id
  variable_set_id = tfe_variable_set.azure_varset.id
}

resource "tfe_variable" "subscription_id" {
  key             = "subscription_id"
  value           = data.azurerm_subscription.current.subscription_id
  category        = "terraform"
  description     = "Azure Subscription ID for Terraform Stacks"
  variable_set_id = tfe_variable_set.azure_varset.id
}

resource "tfe_variable" "client_id" {
  key             = "client_id"
  value           = azuread_application.tfc_application.client_id
  category        = "terraform"
  description     = "Azure Client ID for Terraform Stacks"
  variable_set_id = tfe_variable_set.azure_varset.id
}

resource "tfe_variable" "tenant_id" {
  key             = "tenant_id"
  value           = azuread_service_principal.tfc_service_principal.application_tenant_id
  category        = "terraform"
  description     = "Azure Tenat ID for Terraform Stacks"
  variable_set_id = tfe_variable_set.azure_varset.id
}
