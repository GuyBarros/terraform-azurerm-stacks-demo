identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

store "varset" "azure_vars" {
  id       = "varset-pYC9rF5ZUbdSxidj"
  category = "terraform"
}


deployment "Development" {
  inputs = {
    ### Components: Resource Group
    resource_name_workload = "saug"
    resource_name_environment = "dev"
    location            = "uksouth"
    resource_group_name = "Saug-rg"
    ### Components: Part01-base
    tags = {
      environment = "Development"
      owner       = "tfstacks"
    }

    ### Components: Part02-virtual-network
    address_space = "10.2.0.0/22"
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

    ### Components: Part03-key-vault
    key_administrator_id = "f097f867-8db9-4aa2-ad02-57885ad0ff84"

  }

}

deployment "PreProduction" {
  inputs = {
    ### Components: Resource Group
    resource_name_workload = "saug"
    resource_name_environment = "pre"
    location            = "uksouth"
    resource_group_name = "PreProduction-rg"
    ### Components: Part01-base
    tags = {
      environment = "PreProduction"
      owner       = "tfstacks"
    }

    ### Components: Part02-virtual-network
    address_space = "10.3.0.0/22"
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

    ### Components: Part03-key-vault
    key_administrator_id = "f097f867-8db9-4aa2-ad02-57885ad0ff84"

  }

}

deployment "Production" {
  inputs = {
    ### Components: Resource Group
    resource_name_workload = "saug"
    resource_name_environment = "prod"
    location            = "uksouth"
    resource_group_name = "Production-rg"
    ### Components: Part01-base
    tags = {
      environment = "Production"
      owner       = "tfstacks"
    }

    ### Components: Part02-virtual-network
    address_space = "10.4.0.0/22"
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

    ### Components: Part03-key-vault
    key_administrator_id = "f097f867-8db9-4aa2-ad02-57885ad0ff84"

  }

}

# orchestrate "auto_approve" "safe_plans" {
#     # Ensure that no resource is removed.
#     check {
#         condition = context.plan.changes.remove == 0
#         reason    = "Plan is destroying ${context.plan.changes.remove} resources."
#     }

#     # Ensure that the deployment is not your production environment. 
#     check {
#         condition = context.plan.deployment != deployment.Production
#         reason    = "Production plans are not eligible for auto_approve."
#     }
# }