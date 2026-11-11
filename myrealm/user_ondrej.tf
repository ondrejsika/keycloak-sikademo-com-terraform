module "ondrej_user" {
  source = "../modules/user"

  realm_id   = keycloak_realm.myrealm.id
  username   = "ondrej"
  email      = "ondrej@sikademo.com"
  first_name = "Ondrej"
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
  federated_identities = [
    {
      identity_provider = keycloak_oidc_identity_provider.myrealm_sikalabs_sso.alias
      user_id           = "c0f0a18b-4f31-4032-925c-7ee886ee60ee"
      user_name         = "ondrej"
    },
  ]
}
