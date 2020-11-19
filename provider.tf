terraform {
  backend "gcs" {
    bucket = "devopsexaminfrastructurebucket"
    prefix = "terraformstate"
    credentials = "terraform.json"
  }
}

provider "google" {
  credentials = "terraform.json"
  project     = "examinfrastructure-295710"
  region      = "us-central1"
  zone        = "us-central1-c"
}