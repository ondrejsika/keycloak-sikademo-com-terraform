terraform {
  required_providers {
    keycloak = {
      source = "keycloak/keycloak"
    }
    slu = {
      source = "sikalabsx/slu"
    }
  }
}

variable "realm_id" {}
variable "username" {}
variable "email" {}
variable "first_name" {}
variable "last_name" {}
variable "group_ids" {
  type = list(string)
}
variable "federated_identities" {
  type = list(object({
    identity_provider = string
    user_id           = string
    user_name         = string
  }))
  default = []
}

resource "slu_random_password" "initial_password" {}

resource "keycloak_user" "this" {
  lifecycle {
    ignore_changes = [
      required_actions,
    ]
  }

  realm_id       = var.realm_id
  username       = var.username
  enabled        = true
  email          = var.email
  email_verified = true
  first_name     = var.first_name
  last_name      = var.last_name
  initial_password {
    value     = slu_random_password.initial_password.result
    temporary = true
  }

  dynamic "federated_identity" {
    for_each = var.federated_identities
    content {
      identity_provider = federated_identity.value.identity_provider
      user_id           = federated_identity.value.user_id
      user_name         = federated_identity.value.user_name
    }
  }
}

resource "keycloak_user_groups" "this" {
  realm_id  = var.realm_id
  user_id   = keycloak_user.this.id
  group_ids = var.group_ids
}

output "id" {
  value = keycloak_user.this.id
}

output "initial_password" {
  value     = slu_random_password.initial_password.result
  sensitive = true
}
