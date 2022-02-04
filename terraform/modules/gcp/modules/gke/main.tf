terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.9.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.7.2"
    }
  }
}

provider "google" {
  project                     = var.project_id
  impersonate_service_account = google_service_account.gke_factory.id
  alias                       = "gke_factory"
}
