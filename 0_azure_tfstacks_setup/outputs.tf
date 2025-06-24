output "subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}

output "client_id" {
  value = azuread_application.tfc_application.client_id
}

output "tenant_id" {
  value = azuread_service_principal.tfc_service_principal.application_tenant_id
}

 output "varset_id" {
   value = tfe_variable_set.azure_varset.id
 }