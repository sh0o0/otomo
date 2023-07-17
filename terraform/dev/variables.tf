variable "gcp_project_id" {
  description = "the project to deploy the resources"
  type        = string
}

variable "name" {
  description = "the name prefix for load balancer resources"
  type        = string
}

variable "region" {
  description = "The region of the backend."
  type        = string
}

variable "cloud_run_service" {
  description = "The name of the Cloud Run service."
  type        = string
}

variable "domain" {
  description = "The domain name of the load balancer."
  type        = string
}

variable "image" {
  description = "Image of google cloud run"
  type        = string
}


variable "google_application_credentials_json" {
  description = "GOOGLE_APPLICATION_CREDENTIALS json file"
  type        = string
}
