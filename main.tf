resource "google_cloud_run_service" "default" {
  name     = "devopsexaminfrastructure01"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "us.gcr.io/examinfrastructure-295710/devops_eksamen_infrastructure/devopsexaminfrastructure:299c8c2907c8c8dd3e3b0975511ee744a138fb28"
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
