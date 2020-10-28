locals {
  env = "dev"
}

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  version = "3.5.0"
  project = var.project
}

module "nq-server" {
  source                = "../../modules/cloud-run"
  project               = var.project
  env                   = local.env
  server_name           = var.server_name
  firebase_private_key  = var.firebase_private_key
  firebase_client_email = var.firebase_client_email
}
