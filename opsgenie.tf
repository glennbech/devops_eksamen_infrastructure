# Configure the Opsgenie Provider
provider "opsgenie" {
  api_url = "api.opsgenie.com" #default is api.opsgenie.com
  version = "0.5.2"
}

resource "opsgenie_user" "first" {
  username  = "user@domain.com"
  full_name = "Arne "
  role      = "User"
}

resource "opsgenie_user" "second" {
  username  = "test@domain.com"
  full_name = "Per "
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

//resource "opsgenie_schedule" "test" {
//  name        = "genieschedule-test"
//  description = "schedule test"
//  timezone    = "Europe/Rome"
//  enabled     = false
//}
//
//resource "opsgenie_schedule" "test2" {
//  name          = "genieschedule-test2"
//  description   = "schedule test"
//  timezone      = "Europe/Rome"
//  enabled       = false
//  owner_team_id = opsgenie_team.test.id
//}
