module "fuf_user" {
  source = "../modules/user"

  realm_id   = keycloak_realm.myrealm.id
  username   = "fuf"
  email      = "fuf@sikademo.com"
  first_name = "Fuf"
  last_name  = "Demo"
  group_ids = [
    keycloak_group.argocd_admins.id,
    keycloak_group.vault_admins.id,
    keycloak_group.kubernetes_admins.id,
    keycloak_group.openshift_admins.id,
    keycloak_group.minio_admins.id,
    keycloak_group.grafana_admins.id,
    keycloak_group.harbor_admins.id,
    keycloak_group.silo_admins.id,
  ]
  federated_identities = []
}
