resource "keycloak_oidc_identity_provider" "myrealm_sikalabs_sso" {
  realm              = keycloak_realm.myrealm.id
  alias              = "SikaLabs_SSO"
  issuer             = "https://sso.sikalabs.com/realms/sikalabs"
  authorization_url  = "https://sso.sikalabs.com/realms/sikalabs/protocol/openid-connect/auth"
  token_url          = "https://sso.sikalabs.com/realms/sikalabs/protocol/openid-connect/token"
  user_info_url      = "https://sso.sikalabs.com/realms/sikalabs/protocol/openid-connect/userinfo"
  jwks_url           = "https://sso.sikalabs.com/realms/sikalabs/protocol/openid-connect/certs"
  logout_url         = "https://sso.sikalabs.com/realms/sikalabs/protocol/openid-connect/logout"
  validate_signature = true
  client_id          = "default"
  client_secret      = "default"
  default_scopes     = "openid profile email"
  sync_mode          = "IMPORT"
  trust_email        = true
  extra_config = {
    "clientAuthMethod" = "client_secret_post"
  }
}
