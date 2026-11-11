resource "keycloak_openid_client" "example" {
  realm_id                     = keycloak_realm.myrealm.id
  client_id                    = "example"
  name                         = "example"
  enabled                      = true
  access_type                  = "CONFIDENTIAL"
  client_secret                = "example"
  standard_flow_enabled        = true
  direct_access_grants_enabled = true
  valid_redirect_uris = [
    "*",
  ]
  valid_post_logout_redirect_uris = [
    "*",
  ]
}

resource "keycloak_openid_client_default_scopes" "example" {
  realm_id  = keycloak_realm.myrealm.id
  client_id = keycloak_openid_client.example.id
  default_scopes = [
    "profile",
    "email",
    keycloak_openid_client_scope.myrealm_groups.name,
  ]
}

resource "keycloak_openid_audience_protocol_mapper" "example" {
  realm_id                 = keycloak_realm.myrealm.id
  client_id                = keycloak_openid_client.example.id
  name                     = "audience-mapper"
  included_client_audience = keycloak_openid_client.example.client_id
  add_to_access_token      = true
  add_to_id_token          = true
}
