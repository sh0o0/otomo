/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

terraform {
  cloud {
    organization = "nakar0o0"

    workspaces {
      name = "otomo-dev"
    }
  }

  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.0"
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
