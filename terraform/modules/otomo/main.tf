module "google" {
  source                 = "../google"
  gcp_project_id         = var.gcp_project_id
  gcp_project_name       = var.gcp_project_name
  gcp_billing_account_id = var.gcp_billing_account_id
}

module "firebase" {
  source                         = "../firebase"
  gcp_project_id                 = var.gcp_project_id
  default_google_project_service = module.google.default_google_project_service
  android_package_name           = var.android_package_name
}

module "cloud_run" {
  source                              = "../cloud_run"
  gcp_project_id                      = var.gcp_project_id
  default_google_project_service      = module.google.default_google_project_service
  region                              = var.region
  cloud_run_service_name              = var.cloud_run_service_name
  cloud_run_image_name                = var.cloud_run_image_name
  google_application_credentials_json = var.google_application_credentials_json
  basic_auth_pairs                    = var.basic_auth_pairs
}

module "load_balancer" {
  source                 = "../load_balancer"
  gcp_project_id         = var.gcp_project_id
  cloud_run_service_name = var.cloud_run_service_name
  load_balancer_name     = var.load_balancer_name
  region                 = var.region
}

module "registry" {
  source                         = "../gcr"
  gcp_project_id                 = var.gcp_project_id
  default_google_project_service = module.google.default_google_project_service
}

