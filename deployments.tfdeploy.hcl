identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

store "varset" "azure_vars" {
  id       = "varset-pYC9rF5ZUbdSxidj"
  category = "terraform"
}


deployment "demo" {
  inputs = {
    ### Components: Resource Group
    location            = "uksouth"
    resource_group_name = "demo"
    ### Components: Part01-base
    tags = {
      environment = "demo"
      owner       = "tfstacks"
    }

    ### Components: Part02-virtual-network
    address_space = "10.0.0.0/22"
subnets = {
  AzureBastionSubnet = {
    size                       = 26
    has_nat_gateway            = false
    has_network_security_group = false
  }
  private_endpoints = {
    size                       = 28
    has_nat_gateway            = false
    has_network_security_group = true
  }
  virtual_machines = {
    size                       = 24
    has_nat_gateway            = true
    has_network_security_group = false
  }
}
    identity_token  = identity_token.azurerm.jwt
    client_id       = store.varset.azure_vars.client_id
    subscription_id = store.varset.azure_vars.subscription_id
    tenant_id       = store.varset.azure_vars.tenant_id
  }
}
