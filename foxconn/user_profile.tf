resource "keycloak_realm_user_profile" "foxconn" {
  realm_id = keycloak_realm.foxconn.id

  attribute {
    name         = "username"
    display_name = "$${username}"

    permissions {
      view = ["admin", "user"]
      edit = ["admin", "user"]
    }

    validator {
      name   = "length"
      config = { min = "3", max = "255" }
    }
    validator {
      name = "username-prohibited-characters"
    }
    validator {
      name = "up-username-not-idn-homograph"
    }
  }

  attribute {
    name               = "email"
    display_name       = "$${email}"
    required_for_roles = ["user"]

    permissions {
      view = ["admin", "user"]
      edit = ["admin", "user"]
    }

    validator {
      name = "email"
    }
    validator {
      name   = "length"
      config = { max = "255" }
    }
  }

  attribute {
    name               = "firstName"
    display_name       = "$${firstName}"
    required_for_roles = ["user"]

    permissions {
      view = ["admin", "user"]
      edit = ["admin", "user"]
    }

    validator {
      name   = "length"
      config = { max = "255" }
    }
    validator {
      name = "person-name-prohibited-characters"
    }
  }

  attribute {
    name               = "lastName"
    display_name       = "$${lastName}"
    required_for_roles = ["user"]

    permissions {
      view = ["admin", "user"]
      edit = ["admin", "user"]
    }

    validator {
      name   = "length"
      config = { max = "255" }
    }
    validator {
      name = "person-name-prohibited-characters"
    }
  }

  # Groups imported from myrealm IdP, read-only for users
  attribute {
    name         = "groups"
    display_name = "Groups"
    multi_valued = true

    permissions {
      view = ["admin", "user"]
      edit = ["admin"]
    }
  }
}
