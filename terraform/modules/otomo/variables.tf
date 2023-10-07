variable "gcp_project_id" {
  description = "the project to deploy the resources"
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

variable "firebase_admin_sdk_credentials_json" {
  description = "base64 encoded firebase admin sdk credentials file"
  type        = string
}

variable "basic_auth_pairs" {
  description = "username and password pairs of basic auth"
  type        = string
}

variable "openai_api_key" {
  description = "OpenAI API key"
  type        = string
}
