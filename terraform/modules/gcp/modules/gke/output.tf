output "kube_host" {
  value = "https://${module.gke.endpoint}"
}

output "kube_token" {
  value     = data.google_client_config.default.access_token
  sensitive = true
}

output "kube_cluster_ca_certificate" {
  value     = base64decode(module.gke.ca_certificate)
  sensitive = true
}

