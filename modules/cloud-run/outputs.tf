output "id" {
  value = google_cloud_run_service.cr.id
}

output "status" {
  value = google_cloud_run_service.cr.status
}

output "url" {
  value = google_cloud_run_service.cr.status[0].url
}