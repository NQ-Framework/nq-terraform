module "server" {
  source                = "../../modules/cloud-run"
  project               = var.project
  env                   = var.env
  name                  = var.server_name
  firebase_private_key  = var.firebase_private_key
  firebase_client_email = var.firebase_client_email
}
