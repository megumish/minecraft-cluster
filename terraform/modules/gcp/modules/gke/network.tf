resource "google_compute_network" "gke" {
  project = var.project_id
  name    = "gke"
}
