variable "gcp_project_id" {
  description = "the project to deploy the resources"
  type        = string
}

variable "slack_channel_name" {
  description = "Slack channel name"
  type        = string
}

variable "slack_auth_token" {
  description = "Slack auth token"
  type        = string
}
