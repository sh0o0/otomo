resource "google_monitoring_notification_channel" "default" {
  project      = var.gcp_project_id
  display_name = "Slack"
  type         = "slack"
  labels = {
    "channel_name" = var.slack_channel_name
  }
  sensitive_labels {
    auth_token = var.slack_auth_token
  }
}

resource "google_monitoring_alert_policy" "default" {
  project      = var.gcp_project_id
  display_name = "Error Alert"
  combiner     = "OR"
  conditions {
    display_name = "Error condition"
    condition_matched_log {
      filter = "resource.type=\"cloud_run_revision\" severity>=ERROR"
    }
  }

  notification_channels = [google_monitoring_notification_channel.default.name]
  alert_strategy {
    notification_rate_limit {
      period = "300s"
    }
  }
}
