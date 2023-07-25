output "cloud_run_url" {
  value = element(module.cloud_run.status, 0).url
}

output "load_balancer_ip" {
  value = module.load_balancer.load_balancer_ip
}
