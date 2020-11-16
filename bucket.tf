resource "google_storage_bucket" "static-site" {
  project = "examinfrastructure-295710"
  name = "devopsexaminfrastructurebuckettest"
  location = "US"
}