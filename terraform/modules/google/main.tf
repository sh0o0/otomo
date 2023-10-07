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
}
