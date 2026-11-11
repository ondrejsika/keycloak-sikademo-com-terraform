resource "keycloak_oidc_identity_provider" "myrealm_sikalabs_sso" {
  realm             = keycloak_realm.myrealm.id
  alias             = "SikaLabs_SSO"
  authorization_url = "https://sso.sikalabs.com/realms/sikalabs/protocol/openid-connect/auth"
  client_id         = "default"
  client_secret     = "default"
  token_url         = "https://sso.sikalabs.com/realms/sikalabs/protocol/openid-connect/token"
  extra_config = {
    "clientAuthMethod" = "client_secret_post"
  }
}
