variable "gcp_project_id" {
  description = "the project to deploy the resources"
  type        = string
}

variable "region" {
  description = "The region of the backend."
  type        = string
}

variable "cloud_run_service_name" {
  description = "The name of the Cloud Run service."
  type        = string
}

variable "cloud_run_image_name" {
  description = "Image of google cloud run"
  type        = string
}


variable "google_application_credentials_json" {
  description = "GOOGLE_APPLICATION_CREDENTIALS json file"
  type        = string
}

variable "basic_auth_pairs" {
  # e.g.: a:b,c:d
  description = "username and password pairs of basic auth"
  type        = string
}
