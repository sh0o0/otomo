output "cloud_run_url" {
  value = element(module.cloud_run.status, 0).url
}
