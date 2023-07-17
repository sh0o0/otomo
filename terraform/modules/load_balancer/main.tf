# Load Balancing resources
resource "google_compute_global_address" "default" {
  name = "${var.load_balancer_name}-address"
}

# resource "google_compute_global_forwarding_rule" "default" {
# name   = "${var.load_balancer_name}-fwdrule"

# target = google_compute_target_https_proxy.default.id
# port_range = "443"
# ip_address = google_compute_global_address.default.address
# }

# resource "google_compute_managed_ssl_certificate" "default" {
#   provider = google-beta

#   name = "${var.load_balancer_name}-cert"
#   managed {
#     domains = [var.api_domain]
#   }
# }

resource "google_compute_backend_service" "default" {
  name = "${var.load_balancer_name}-backend"

  protocol    = "HTTP"
  port_name   = "http"
  timeout_sec = 30

  backend {
    group = google_compute_region_network_endpoint_group.cloudrun_neg.id
  }
}

resource "google_compute_url_map" "default" {
  name = "${var.load_balancer_name}-urlmap"

  default_service = google_compute_backend_service.default.id
}

# resource "google_compute_target_https_proxy" "default" {
#   name   = "${var.load_balancer_name}-https-proxy"

#   url_map          = google_compute_url_map.default.id
#   ssl_certificates = [google_compute_managed_ssl_certificate.default.id]
# }

resource "google_compute_region_network_endpoint_group" "cloudrun_neg" {
  provider              = google-beta
  name                  = "${var.load_balancer_name}-neg"
  network_endpoint_type = "SERVERLESS"
  region                = var.region
  cloud_run {
    service = var.cloud_run_service_name
  }
}

# HTTP-to-HTTPS resources

# resource "google_compute_url_map" "https_redirect" {
#   name            = "${var.load_balancer_name}-https-redirect"

#   default_url_redirect {
#     https_redirect         = true
#     redirect_response_code = "MOVED_PERMANENTLY_DEFAULT"
#     strip_query            = false
#   }
# }

# resource "google_compute_target_http_proxy" "https_redirect" {
#   name   = "${var.load_balancer_name}-http-proxy"
#   url_map          = google_compute_url_map.https_redirect.id
# }

# resource "google_compute_global_forwarding_rule" "https_redirect" {
#   name   = "${var.load_balancer_name}-fwdrule-http"

#   target = google_compute_target_http_proxy.https_redirect.id
#   port_range = "80"
#   ip_address = google_compute_global_address.default.address
# }

# Outputs
