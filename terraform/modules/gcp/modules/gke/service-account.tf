resource "google_service_account" "gke_factory" {
  project      = var.project_id
  account_id   = "gke-factory"
  display_name = "GKE Factory"
}

resource "google_project_iam_policy" "project" {
  project     = var.project_id
  policy_data = data.google_iam_policy.gke_factory.policy_data
}

data "google_iam_policy" "gke_factory" {
  dynamic "binding" {
    for_each = ["roles/editor"]
    iterator = role
    content {
      role = role.value
      members = [
        "serviceAccount:${google_service_account.gke_factory.email}",
      ]
    }
  }
}
