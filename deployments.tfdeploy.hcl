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
     address_space = ["10.0.0.0/16"]
     subnets = {
    "subnet1" = {
      name             = "subnet1"
      address_prefixes = ["10.0.0.0/24"]
    }
    "subnet2" = {
      name             = "subnet2"
      address_prefixes = ["10.0.1.0/24"]
    }
  }
    identity_token  = identity_token.azurerm.jwt
    client_id       = store.varset.azure_vars.client_id
    subscription_id = store.varset.azure_vars.subscription_id
    tenant_id       = store.varset.azure_vars.tenant_id
  }
}
