resource "google_apikeys_key" "otomo_api_key" {
  name         = "otomo-api-key"
  display_name = "Otomo API Key"
  project      = var.gcp_project_id
}
