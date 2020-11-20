resource "google_cloud_run_service" "default" {
  name     = "devopsexaminfrastructure01"
  location = "us-central1"
  project = "examinfrastructure-295710"

  template {
    spec {
      containers {
        image = "us.gcr.io/examinfrastructure-295710/devops_eksamen_infrastructure/devopsexaminfrastructure@sha256:60616de5e0a0282f1a33fa07720689021dac212850f3d69754a0fc5e4ac663c6"
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
