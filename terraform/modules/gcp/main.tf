terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.9.0"
    }
  }
}

resource "google_service_account" "gke_factory" {
  project      = module.project.project_id
  account_id   = "gke-factory"
  display_name = "GKE Factory"
}

provider "google" {
  project                     = module.project.project_id
  impersonate_service_account = google_service_account.gke_factory.id
  alias                       = "gke_factory"
}
