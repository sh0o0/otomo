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

provider "google" {
  project = var.gcp_project_id
}

provider "google-beta" {
  project = var.gcp_project_id
}

module "cloud_run" {
  source                              = "../cloud_run"
  gcp_project_id                      = var.gcp_project_id
  region                              = var.region
  cloud_run_service                   = var.cloud_run_service_name
  image                               = var.cloud_run_image_name
  google_application_credentials_json = var.google_application_credentials_json
  basic_auth_pairs                    = var.basic_auth_pairs
}

module "load_balancer" {
  source            = "../load_balancer"
  cloud_run_service = var.cloud_run_service_name
  name              = var.load_balancer_name
  region            = var.region
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
