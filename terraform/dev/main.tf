terraform {
  cloud {
    organization = "nakar0o0"

    workspaces {
      name = "otomo-dev"
    }
  }
}

module "otomo" {
  source                              = "../modules/otomo"
  gcp_project_id                      = var.gcp_project_id
  gcp_project_name                    = var.gcp_project_name
  region                              = var.region
  load_balancer_name                  = var.load_balancer_name
  cloud_run_service_name              = var.cloud_run_service_name
  cloud_run_image_name                = var.cloud_run_image_name
  api_domain                          = var.api_domain
  google_application_credentials_json = var.google_application_credentials_json
  basic_auth_pairs                    = var.basic_auth_pairs
  gcp_billing_account_id              = var.gcp_billing_account_id
  android_package_name                = var.android_package_name
}
