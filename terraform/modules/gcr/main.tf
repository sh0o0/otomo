resource "google_container_registry" "default" {
  project  = var.gcp_project_id
  location = "ASIA"
}
