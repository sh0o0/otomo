resource "google_project" "default" {
  project_id      = var.gcp_project_id
  name            = var.gcp_project_name
  billing_account = var.gcp_billing_account_id

  labels = {
    "firebase" = "enabled"
  }
}

resource "google_project_service" "default" {
  project = google_project.default.project_id
  for_each = toset([
    "firebase.googleapis.com",
  ])
  service = each.key

  disable_on_destroy = false
}

resource "google_firebase_project" "default" {
  provider = google-beta
  project  = google_project.default.project_id

  depends_on = [
    google_project_service.default
  ]
}

resource "google_firebase_android_app" "default" {
  provider = google-beta

  project      = google_project.default.project_id
  display_name = "Android"
  package_name = var.android_package_name

  depends_on = [
    google_firebase_project.default,
  ]
}
