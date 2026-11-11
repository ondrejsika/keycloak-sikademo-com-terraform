locals {
  email_groups = [
    "gmail.com",
    "sika.io",
    "sikalabs.com",
    "ondrejsika.com",
  ]
}

resource "keycloak_oidc_identity_provider" "myrealm_email_sso" {
  realm             = keycloak_realm.myrealm.id
  alias             = "Email_SSO"
  issuer            = "https://sso-email.sikalabs.com"
  authorization_url = "https://sso-email.sikalabs.com/authorize"
  token_url         = "https://sso-email.sikalabs.com/token"
  user_info_url     = "https://sso-email.sikalabs.com/userinfo"
  client_id         = "client"
  client_secret     = "secret"
  sync_mode         = "FORCE"
  extra_config = {
    "clientAuthMethod" = "client_secret_post"
  }
}

resource "keycloak_group" "email_sso" {
  for_each = toset(local.email_groups)

  realm_id = keycloak_realm.myrealm.id
  name     = each.value
}

resource "keycloak_custom_identity_provider_mapper" "myrealm_email_sso_group" {
  for_each = toset(local.email_groups)

  realm                    = keycloak_realm.myrealm.id
  name                     = "group-${each.value}"
  identity_provider_alias  = keycloak_oidc_identity_provider.myrealm_email_sso.alias
  identity_provider_mapper = "oidc-advanced-group-idp-mapper"
  extra_config = {
    syncMode                 = "FORCE"
    group                    = each.value
    "are.claim.values.regex" = "false"
    claims                   = jsonencode([{ key = "groups", value = each.value }])
  }
}
