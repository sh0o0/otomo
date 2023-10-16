terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project               = var.gcp_project_id
  billing_project       = var.gcp_project_id
  user_project_override = true
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
    "apikeys.googleapis.com",
    "cloudbilling.googleapis.com",
    "billingbudgets.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "serviceusage.googleapis.com",
  ])
  service = each.key

  disable_on_destroy = false
}
data "google_project" "project" {
  project_id = var.gcp_project_id
}

data "google_billing_account" "account" {
  billing_account = var.gcp_billing_account_id
}

resource "google_billing_budget" "budget" {
  billing_account = data.google_billing_account.account.id
  display_name    = "Test"

  budget_filter {
    projects = ["projects/${data.google_project.project.number}"]
  }

  amount {
    specified_amount {
      currency_code = "JPY"
      units         = "10000"
    }
  }
  threshold_rules {
    threshold_percent = 0.5
  }
}
