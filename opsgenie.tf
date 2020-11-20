# Configure the Opsgenie Provider
provider "opsgenie" {
  api_url = "api.opsgenie.com" #default is api.opsgenie.com
  version = "0.5.2"
}

resource "opsgenie_user" "first" {
  username  = "user@domain.com"
  full_name = "name "
  role      = "User"
}

resource "opsgenie_user" "second" {
  username  = "test@domain.com"
  full_name = "name "
  role      = "User"
}

resource "opsgenie_team" "test" {
  name        = "example"
  description = "This team deals with all the things"

  member {
    id   = opsgenie_user.first.id
    role = "admin"
  }

  member {
    id   = opsgenie_user.second.id
    role = "user"
  }
}

resource "opsgenie_team" "self-service" {
  name           = "Self Service"
  description    = "Membership in this team is managed via OpsGenie web UI only"
  ignore_members = true
  delete_default_resources = true
}
