module "gke" {
  source = "./modules/gke"

  providers = {
    google = google.gke_factory
  }
}
