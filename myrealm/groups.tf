resource "keycloak_group" "argocd_admins" {
  realm_id = keycloak_realm.myrealm.id
  name     = "argocd-admins"
}

resource "keycloak_group" "minio_admins" {
  realm_id = keycloak_realm.myrealm.id
  name     = "minio-admins"
}

resource "keycloak_group" "silo_admins" {
  realm_id = keycloak_realm.myrealm.id
  name     = "silo-admins"
}

resource "keycloak_group" "grafana_admins" {
  realm_id = keycloak_realm.myrealm.id
  name     = "grafana-admins"
}

resource "keycloak_group" "vault_admins" {
  realm_id = keycloak_realm.myrealm.id
  name     = "vault-admins"
}

resource "keycloak_group" "kubernetes_admins" {
  realm_id = keycloak_realm.myrealm.id
  name     = "kubernetes-admins"
}

resource "keycloak_group" "openshift_admins" {
  realm_id = keycloak_realm.myrealm.id
  name     = "openshift-admins"
}

resource "keycloak_group" "harbor_admins" {
  realm_id = keycloak_realm.myrealm.id
  name     = "harbor-admins"
}
