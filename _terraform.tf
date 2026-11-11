terraform {
  required_providers {
    keycloak = {
      source = "keycloak/keycloak"
    }
  }
}

variable "keycloak_url" {}
variable "keycloak_username" {}
variable "keycloak_password" {}

provider "keycloak" {
  client_id = "admin-cli"
  url       = var.keycloak_url
  username  = var.keycloak_username
  password  = var.keycloak_password
}
