terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.9.0"
    }
  }
}

resource "google_service_account" "service_account" {
  project      = module.project.project_id
  account_id   = "gke-factory"
  display_name = "GKE Factory"
}
