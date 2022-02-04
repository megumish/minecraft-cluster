resource "google_compute_network" "gke" {
  provider = google.gke_factory

  project = var.project_id
  name    = "gke"
}
