required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "~> 4.0"
  }
  random = {
    source  = "hashicorp/random"
    version = "~> 3.6.3"
  }
  azapi = {
    source  = "azure/azapi"
    version = "~> 2.4.0"
  }
  modtm = {
    source  = "azure/modtm"
    version = "~> 0.3.5"
  }
  time = {
    source  = "hashicorp/time"
    version = "~> 0.9.1"
  }

  http = {
    source  = "hashicorp/http"
    version = "~> 3.0"
  }

}

provider "azurerm" "this" {
  config {
    features {
      resource_group {
        prevent_deletion_if_contains_resources = false # This is to handle MCAPS or other policy driven resource creation.
      }
    }
    resource_provider_registrations = "extended"
    storage_use_azuread             = true
    use_cli                         = false
    use_oidc                        = true
    oidc_token                      = var.identity_token
    client_id                       = var.client_id
    subscription_id                 = var.subscription_id
    tenant_id                       = var.tenant_id
  }
}
provider "random" "this" {}
provider "azapi" "this" {
  config {
    use_cli         = false
    use_oidc        = true
    oidc_token      = var.identity_token
    client_id       = var.client_id
    subscription_id = var.subscription_id
    tenant_id       = var.tenant_id
  }
}
provider "modtm" "this" {}
provider "time" "this" {}
provider "http" "this" {}