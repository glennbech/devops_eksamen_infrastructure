resource "google_storage_bucket" "static-site" {
  project = "devopsexam-295612"
  name = "devopsexaminfrastructurebucket01"
  location = "US"
}