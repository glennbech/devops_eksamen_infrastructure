terraform {
  backend "gcs" {
    bucket = "devopsexaminfrastructurebucket"
    prefix = "terraformstate"
    credentials = "terraform.json"
  }
}

provider "google" {
  credentials = "${file("terraform.json")}"
  project     = "devopsexam-295612"
  region      = "us-central1"
  zone        = "us-central1-c"
}