variable "gcp_project_id" {
  description = "the project to deploy the resources"
  type = string
}

variable "cloud_run_service_name" {
  type = string
}

variable "load_balancer_name" {
  description = "the name prefix for load balancer resources"
  type        = string
}

variable "region" {
  description = "The region of the backend."
  type        = string
}
