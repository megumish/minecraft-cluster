resource "google_compute_network" "gke" {
  provider = google.gke_factory

  project                         = var.project_id
  name                            = "gke"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}
