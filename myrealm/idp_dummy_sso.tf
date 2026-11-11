resource "keycloak_oidc_identity_provider" "myrealm_dummy_sso" {
  realm              = keycloak_realm.myrealm.id
  alias              = "Dummy_SSO"
  issuer             = "https://sso-dummy.panda.k8s.sl.zone"
  authorization_url  = "https://sso-dummy.panda.k8s.sl.zone/authorize"
  token_url          = "https://sso-dummy.panda.k8s.sl.zone/token"
  user_info_url      = "https://sso-dummy.panda.k8s.sl.zone/userinfo"
  jwks_url           = "https://sso-dummy.panda.k8s.sl.zone/.well-known/jwks.json"
  validate_signature = true
  client_id          = "client"
  client_secret      = "secret"
  default_scopes     = "openid profile email"
  sync_mode          = "FORCE"
  extra_config = {
    "clientAuthMethod" = "client_secret_post"
  }
}
