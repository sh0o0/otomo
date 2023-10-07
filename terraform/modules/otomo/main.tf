module "google" {
  source         = "../google"
  gcp_project_id = var.gcp_project_id
}

module "cloud_run" {
  source                              = "../cloud_run"
  gcp_project_id                      = var.gcp_project_id
  region                              = var.region
  cloud_run_service_name              = var.cloud_run_service_name
  cloud_run_image_name                = var.cloud_run_image_name
  google_application_credentials_json = var.google_application_credentials_json
  basic_auth_pairs                    = var.basic_auth_pairs
  openai_api_key                      = var.openai_api_key
  google_maps_api_key                 = var.google_maps_api_key
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
}

