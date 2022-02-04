resource "google_service_account" "gke_factory" {
  project      = var.project_id
  account_id   = "gke-factory"
  display_name = "GKE Factory"
}
