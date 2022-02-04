resource "google_service_account" "gke_factory" {
  project      = var.project_id
  account_id   = "gke-factory"
  display_name = "GKE Factory"
}

resource "google_service_account" "gke_cluster" {
  project      = var.project_id
  account_id   = "gke-cluster"
  display_name = "GKE cluster service account"
}
