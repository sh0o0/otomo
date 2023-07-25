resource "google_firebase_project" "default" {
  provider = google-beta
  project  = var.default_google_project.project_id

  depends_on = [
    var.default_google_project_service
  ]
}

resource "google_firebase_android_app" "default" {
  provider = google-beta

  project      = var.default_google_project.project_id
  display_name = "Android"
  package_name = var.android_package_name

  depends_on = [
    var.default_google_project_service
  ]
}
