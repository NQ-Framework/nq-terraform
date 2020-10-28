resource "google_project_service" "run" {
  service = "run.googleapis.com"
  disable_on_destroy = false
}

resource "google_cloud_run_service" "cr" {
  name     = "${var.name}-${var.env}"
  location = "europe-west1"

  template {
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale"  = "1000"
        "client.knative.dev/user-image"     = "gcr.io/nq-framework/nq-server:bf069a75291902913b80ab4fec8bb4ef183e5dce"
        "run.googleapis.com/client-name"    = "gcloud"
        "run.googleapis.com/client-version" = "286.0.0"
      }
    }
    spec {
      container_concurrency = 80
      service_account_name  = "384505471856-compute@developer.gserviceaccount.com"
      containers {
        image = "gcr.io/nq-framework/nq-server:bf069a75291902913b80ab4fec8bb4ef183e5dce"
        env {
          name  = "PROJECT_ID"
          value = var.project
        }
        env {
          name  = "PRIVATE_KEY"
          value = var.firebase_private_key
        }
        env {
          name  = "CLIENT_EMAIL"
          value = var.firebase_client_email
        }
        env {
          name  = "ENV"
          value = var.env
        }
        resources {
          limits = {
            cpu    = "1000m"
            memory = "244Mi"
          }
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
  depends_on = [google_project_service.run]
}

resource "google_cloud_run_service_iam_member" "allUsers" {
  service  = google_cloud_run_service.cr.name
  location = google_cloud_run_service.cr.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}
