resource "google_compute_network" "gke" {
  project                         = var.project_id
  name                            = "gke"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}
