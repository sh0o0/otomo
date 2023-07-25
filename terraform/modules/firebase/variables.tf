variable "gcp_project_id" {
  description = "the project to deploy the resources"
  type        = string
}

variable "gcp_project_name" {
  description = "the gcp project name"
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
