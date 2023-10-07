terraform {
  cloud {
    organization = "nakar0o0"

    workspaces {
      name = "otomo-dev"
    }
  }
}

module "otomo" {
  source                              = "../../modules/otomo"
  gcp_project_id                      = var.gcp_project_id
  region                              = var.region
  load_balancer_name                  = var.load_balancer_name
  cloud_run_service_name              = var.cloud_run_service_name
  cloud_run_image_name                = var.cloud_run_image_name
  api_domain                          = var.api_domain
  firebase_admin_sdk_credentials_json = var.firebase_admin_sdk_credentials_json
  basic_auth_pairs                    = var.basic_auth_pairs
  openai_api_key                      = var.openai_api_key
}

