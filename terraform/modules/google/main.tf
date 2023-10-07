terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
}

provider "google-beta" {
  project = var.gcp_project_id
}

resource "google_project_service" "default" {
  project = var.gcp_project_id
  for_each = toset([
    "run.googleapis.com",
    "compute.googleapis.com",
    "firestore.googleapis.com",
    "maps-android-backend.googleapis.com",
    "maps-ios-backend.googleapis.com",
    "places-backend.googleapis.com",
    "geocoding-backend.googleapis.com",
  ])
  service = each.key

  disable_on_destroy = false
}
