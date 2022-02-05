output "gke_factory_sa_email" {
  value = google_service_account.gke_factory.email
}

output "cluster_sa_email" {
  value = google_service_account.gke_cluster.email
}

output "etag" {
  value = google_project_iam_policy.gke_factory_and_project_factory_additional.etag
}
