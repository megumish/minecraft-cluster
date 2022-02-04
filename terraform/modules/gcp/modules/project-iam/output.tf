output "gke_factory_sa_email" {
  value = google_service_account.gke_factory.email
}

output "cluster_sa_email" {
  value = google_service_account.gke_cluster.email
}
