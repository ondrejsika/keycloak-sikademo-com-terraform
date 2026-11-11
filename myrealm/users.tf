output "initial_passwords" {
  value = {
    fuf    = module.fuf_user.initial_password
    ondrej = module.ondrej_user.initial_password
  }
  sensitive = true
}
