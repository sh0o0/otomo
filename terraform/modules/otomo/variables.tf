variable "gcp_project_id" {
  description = "the project to deploy the resources"
  type        = string
}

variable "gcp_project_name" {
  description = "the gcp project name"
  type        = string
}

variable "load_balancer_name" {
  description = "the name prefix for load balancer resources"
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

variable "api_domain" {
  description = "The domain name of the load balancer."
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
  description = "username and password pairs of basic auth"
  type        = string
}

variable "gcp_billing_account_id" {
  description = "the project id for billing"
  type        = string
}

variable "android_package_name" {
  description = "the android package name for firebase"
  type        = string
}

variable "ios_bundle_name" {
  description = "the ios package name"
  type        = string
}

variable "openai_api_key" {
  description = "OpenAI API key"
  type        = string
}

variable "google_maps_api_key" {
  description = "Google Maps API key"
  type        = string
}

