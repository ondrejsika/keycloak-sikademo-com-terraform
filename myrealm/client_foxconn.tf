# Client for foxconn realm federation (foxconn -> myrealm)
resource "keycloak_openid_client" "foxconn" {
  realm_id              = keycloak_realm.myrealm.id
  client_id             = "foxconn"
  name                  = "foxconn"
  enabled               = true
  access_type           = "CONFIDENTIAL"
  client_secret         = "foxconn"
  standard_flow_enabled = true
  valid_redirect_uris = [
    "${var.keycloak_url}/realms/foxconn/broker/myrealm/endpoint",
  ]
  valid_post_logout_redirect_uris = [
    "*",
  ]
}
