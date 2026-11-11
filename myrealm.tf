module "myrealm" {
  source = "./myrealm"
}

output "myrealm_initial_passwords" {
  value     = module.myrealm.initial_passwords
  sensitive = true
}
