variable "gcp_project_id" {
  description = "the project to deploy the resources"
  type        = string
}

variable "default_google_project_service" {
  description = "the project service with GCP"
}

variable "android_package_name" {
  description = "the android package name for firebase"
  type        = string
}

variable "ios_bundle_name" {
  description = "the ios package name"
  type        = string
}
