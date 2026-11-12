module "myrealm" {
  source       = "./myrealm"
  keycloak_url = var.keycloak_url
}

output "myrealm_initial_passwords" {
  value     = module.myrealm.initial_passwords
  sensitive = true
}
