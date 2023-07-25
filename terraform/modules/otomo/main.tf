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


module "firebase" {
  source                 = "../firebase"
  gcp_project_id         = var.gcp_project_id
  gcp_project_name       = var.gcp_project_name
  gcp_billing_account_id = var.gcp_billing_account_id
  android_package_name   = var.android_package_name
}

module "cloud_run" {
  source                              = "../cloud_run"
  gcp_project_id                      = var.gcp_project_id
  region                              = var.region
  cloud_run_service_name              = var.cloud_run_service_name
  cloud_run_image_name                = var.cloud_run_image_name
  google_application_credentials_json = var.google_application_credentials_json
  basic_auth_pairs                    = var.basic_auth_pairs
}

module "load_balancer" {
  source                 = "../load_balancer"
  cloud_run_service_name = var.cloud_run_service_name
  load_balancer_name     = var.load_balancer_name
  region                 = var.region
}

module "registry" {
  source         = "../gcr"
  gcp_project_id = var.gcp_project_id
}

output "cloud_run_url" {
  value = element(module.cloud_run.status, 0).url
}

output "load_balancer_ip" {
  value = module.load_balancer.load_balancer_ip
}
