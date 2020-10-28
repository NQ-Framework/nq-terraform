terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  version = "3.5.0"

  credentials = file("nq-framework-e6b01ad3b116.json")

  project = "nq-framework"
  region  = "europe-west1"
  zone    = "europe-west1-b"
}


