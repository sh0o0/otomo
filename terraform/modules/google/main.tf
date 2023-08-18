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
  project               = var.gcp_project_id
  user_project_override = true
}


# resource "google_project" "default" {
#   project_id      = var.gcp_project_id
#   name            = var.gcp_project_name

#   labels = {
#     "firebase" = "enabled"
#   }

#   depends_on = [
#     google_project_service.default
#   ]
# }

resource "google_project_service" "default" {
  project = var.gcp_project_id
  for_each = toset([
    "cloudresourcemanager.googleapis.com",
    "run.googleapis.com",
    "cloudbilling.googleapis.com",
    "compute.googleapis.com",
    "firebase.googleapis.com",
    "serviceusage.googleapis.com",
    "firestore.googleapis.com",
    "identitytoolkit.googleapis.com",
  ])
  service = each.key

  disable_on_destroy = false
}
