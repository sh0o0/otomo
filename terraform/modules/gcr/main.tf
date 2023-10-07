resource "google_container_registry" "default" {
  provider = google-beta
  project  = var.gcp_project_id

  location = "US"
}
