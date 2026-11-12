resource "keycloak_realm" "foxconn" {
  realm                    = "foxconn"
  enabled                  = true
  display_name_html        = "<h1>foxconn SSO</h1>"
  login_with_email_allowed = true
  reset_password_allowed   = true
  remember_me              = true
  login_theme              = "ondrejsika"
}

resource "keycloak_realm_events" "foxconn" {
  lifecycle {
    ignore_changes = [
      events_listeners,
    ]
  }

  realm_id = keycloak_realm.foxconn.id

  events_enabled    = true
  events_expiration = 3600

  admin_events_enabled         = true
  admin_events_details_enabled = true
}
