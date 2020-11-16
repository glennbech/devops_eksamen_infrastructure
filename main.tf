resource "google_cloud_run_service" "default" {
  name     = "devopsexaminfrastructure01"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "us.gcr.io/examinfrastructure-295710/devops_eksamen_infrastructure/devopsexaminfrastructure@sha256:2b180488fa02f2fada630b782dfdadbaf6efd9ac81a1ba59ff0d2b206e170407"
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