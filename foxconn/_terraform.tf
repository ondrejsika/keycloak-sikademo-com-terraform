terraform {
  required_providers {
    keycloak = {
      source = "keycloak/keycloak"
    }
  }
}

variable "keycloak_url" {}
