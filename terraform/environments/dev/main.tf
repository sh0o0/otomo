terraform {
  cloud {
    organization = "nakar0o0"

    workspaces {
      name = "otomo-dev"
    }
  }
}

module "otomo" {
  source                              = "../../modules/otomo"
  gcp_project_id                      = var.gcp_project_id
  region                              = var.region
  load_balancer_name                  = var.load_balancer_name
  cloud_run_service_name              = var.cloud_run_service_name
  cloud_run_image_name                = var.cloud_run_image_name
  api_domain                          = var.api_domain
  firebase_admin_sdk_credentials_json = var.firebase_admin_sdk_credentials_json
  basic_auth_pairs                    = var.basic_auth_pairs
  openai_api_key                      = var.openai_api_key
  slack_channel_name                  = var.slack_channel_name
  slack_auth_token                    = var.slack_auth_token
}

resource "tfe_organization" "default" {
  name  = "nakar0o0"
  email = "shoutaro425@gmail.com"
}

resource "tfe_workspace" "default" {
  name         = "otomo-dev"
  organization = tfe_organization.default.id
}

resource "tfe_notification_configuration" "default" {
  name             = "Slack"
  enabled          = true
  destination_type = "slack"
  triggers         = ["run:created", "run:planning", "run:needs_attention", "run:applying", "run:completed", "run:errored", "assessment:check_failure", "assessment:drifted", "assessment:failed"]
  url              = "https://hooks.slack.com/services/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"
  workspace_id     = tfe_workspace.default.id
}
