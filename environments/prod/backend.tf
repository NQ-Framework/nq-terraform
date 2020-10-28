terraform {
  backend "gcs" {
    bucket      = "nq-framework-tfstate"
    prefix      = "env/prod"
    credentials = "../../nq-framework-e6b01ad3b116.json"
  }
}
