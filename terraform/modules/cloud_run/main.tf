
# Cloud Run service and permissions
resource "google_cloud_run_service" "default" {
  name     = var.cloud_run_service_name
  location = var.region
  provider = google-beta
  project  = var.gcp_project_id

  depends_on = [
    var.default_google_project_service
  ]

  autogenerate_revision_name = true

  template {
    spec {
      containers {
        image = "us.gcr.io/${var.gcp_project_id}/${var.cloud_run_image_name}"
        env {
          name  = "API_DEBUG"
          value = "true"
        }
        env {
          name  = "API_PORT"
          value = "8080"
        }

        env {
          name  = "GCP_PROJECT_ID"
          value = var.gcp_project_id
        }
        env {
          name  = "GOOGLE_APPLICATION_CREDENTIALS_JSON"
          value = var.google_application_credentials_json
        }
        env {
          name  = "BASIC_AUTH_PAIRS"
          value = var.basic_auth_pairs
        }
      }
    }
  }
}

resource "google_cloud_run_service_iam_member" "member" {
  location = google_cloud_run_service.default.location
  project  = google_cloud_run_service.default.project
  service  = google_cloud_run_service.default.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
