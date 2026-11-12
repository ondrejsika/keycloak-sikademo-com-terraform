locals {
  myrealm_url = "${var.keycloak_url}/realms/myrealm"
}

resource "keycloak_oidc_identity_provider" "foxconn_myrealm" {
  realm              = keycloak_realm.foxconn.id
  alias              = "myrealm"
  display_name       = "myrealm SSO"
  issuer             = local.myrealm_url
  authorization_url  = "${local.myrealm_url}/protocol/openid-connect/auth"
  token_url          = "${local.myrealm_url}/protocol/openid-connect/token"
  user_info_url      = "${local.myrealm_url}/protocol/openid-connect/userinfo"
  jwks_url           = "${local.myrealm_url}/protocol/openid-connect/certs"
  logout_url         = "${local.myrealm_url}/protocol/openid-connect/logout"
  validate_signature = true
  client_id          = "foxconn"
  client_secret      = "foxconn"
  default_scopes     = "openid profile email"
  sync_mode          = "IMPORT"
  trust_email        = true
  extra_config = {
    "clientAuthMethod" = "client_secret_post"
  }
}
