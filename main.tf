resource "google_cloud_run_service" "default" {
  name     = "devopsexaminfrastructure01"
  location = "us-central1"
  project = "examinfrastructure-295710"

  template {
    spec {
      containers {
        image = "us.gcr.io/examinfrastructure-295710/devops_eksamen_infrastructure/devopsexaminfrastructure@sha256:e06ad60f698db03128a116a8dda1961477f696f51ba7b1ebd6ee0eb9d6b284aa"
        env {
          name = "LOGZ_TOKEN"
          value = var.logz_token
        }
        env {
          name = "LOGZ_URL"
          value = var.logz_url
        }
      }
    }
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.default.location
  project     = google_cloud_run_service.default.project
  service     = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
