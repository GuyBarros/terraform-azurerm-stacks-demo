identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

store "varset" "azure_vars" {
  id       = "varset-pYC9rF5ZUbdSxidj"
  category = "terraform"
}


deployment "demo" {
  inputs = {
    location    = "uksouth"
    resource_group_name = "demo"

    identity_token  = identity_token.azurerm.jwt
    client_id       = store.varset.azure_vars.client_id
    subscription_id = store.varset.azure_vars.subscription_id
    tenant_id       = store.varset.azure_vars.tenant_id
  }
}
