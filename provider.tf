terraform {
  backend "gcs" {
    bucket = "devopsexam-295612"
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