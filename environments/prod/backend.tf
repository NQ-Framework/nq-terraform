terraform {
  backend "gcs" {
    bucket      = "nq-framework-tfstate"
    prefix      = "env/prod"
  }
}
