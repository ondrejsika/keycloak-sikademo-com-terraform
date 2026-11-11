resource "keycloak_realm" "myrealm" {
  realm                    = "myrealm"
  enabled                  = true
  display_name_html        = "<h1>myrealm SSO</h1>"
  login_with_email_allowed = true
  reset_password_allowed   = true
  remember_me              = true
  login_theme              = "sikademo"
}

resource "keycloak_realm_events" "myrealm" {
  lifecycle {
    ignore_changes = [
      events_listeners,
    ]
  }

  realm_id = keycloak_realm.myrealm.id

  events_enabled    = true
  events_expiration = 3600

  admin_events_enabled         = true
  admin_events_details_enabled = true
}

resource "keycloak_openid_client_scope" "myrealm_groups" {
  realm_id               = keycloak_realm.myrealm.id
  name                   = "groups"
  include_in_token_scope = true
  gui_order              = 1
}

resource "keycloak_openid_group_membership_protocol_mapper" "myrealm_groups" {
  realm_id        = keycloak_realm.myrealm.id
  client_scope_id = keycloak_openid_client_scope.myrealm_groups.id
  name            = "groups"
  claim_name      = "groups"
  full_path       = false
}
