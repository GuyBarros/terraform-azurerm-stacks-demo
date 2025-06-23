identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "demo" {
  inputs = {
    location    = "ukwest2"
    esource_group_name = "demo"

    identity_token  = identity_token.azurerm.jwt
    client_id       = "638e629e-c5af-46e4-a5ad-fbf878019830"
    subscription_id = "060dd639-5e85-4751-ac73-bcf0371c57a2"
    tenant_id       = "237fbc04-c52a-458b-af97-eaf7157c0cd4"
  }
}
