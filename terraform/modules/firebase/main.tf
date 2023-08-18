# Firebase
resource "google_firebase_project" "default" {
  provider = google-beta
  project  = var.gcp_project_id

  depends_on = [
    var.default_google_project_service
  ]
}

# Mobile
resource "google_firebase_android_app" "default" {
  provider = google-beta

  project      = var.gcp_project_id
  display_name = "Android"
  package_name = var.android_package_name

  depends_on = [
    var.default_google_project_service
  ]
}

resource "google_firebase_apple_app" "default" {
  provider = google-beta

  project      = var.gcp_project_id
  display_name = "iOS"
  bundle_id    = var.ios_bundle_name

  depends_on = [
    var.default_google_project_service
  ]
}


# Firestore
resource "google_firestore_database" "database" {
  project     = var.gcp_project_id
  name        = "(default)"
  location_id = "nam5"
  type        = "FIRESTORE_NATIVE"

  depends_on = [
    var.default_google_project_service
  ]
}

# Authoentication
resource "google_identity_platform_config" "default" {
  project = var.gcp_project_id
}

resource "google_identity_platform_project_default_config" "default" {
  project = var.gcp_project_id

  sign_in {
    allow_duplicate_emails = false

    anonymous {
      enabled = false
    }

    email {
      enabled           = true
      password_required = false
    }
  }
}
