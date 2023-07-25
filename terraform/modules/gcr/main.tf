resource "google_container_registry" "default" {
  provider = google-beta
  project  = var.gcp_project_id

  depends_on = [
    var.default_google_project_service
  ]

  location = "ASIA"
}
