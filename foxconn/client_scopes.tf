resource "keycloak_openid_client_scope" "foxconn_groups" {
  realm_id               = keycloak_realm.foxconn.id
  name                   = "groups"
  include_in_token_scope = true
  gui_order              = 1
}

# Expose "groups" user attribute (imported from myrealm) as "groups" claim
resource "keycloak_openid_user_attribute_protocol_mapper" "foxconn_groups" {
  realm_id        = keycloak_realm.foxconn.id
  client_scope_id = keycloak_openid_client_scope.foxconn_groups.id
  name            = "groups"
  user_attribute  = "groups"
  claim_name      = "groups"
  multivalued     = true
}
