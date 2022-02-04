resource "google_service_account" "gke_factory" {
  project      = var.project_id
  account_id   = "gke-factory"
  display_name = "GKE Factory"
}

resource "google_project_iam_policy" "gke_factory_and_project_factory_additional" {
  project     = var.project_id
  policy_data = data.google_iam_policy.gke_factory_and_project_factory_additional.policy_data
}

data "google_iam_policy" "gke_factory_and_project_factory_additional" {
  dynamic "binding" {
    for_each = ["roles/container.serviceAgent"]
    iterator = role
    content {
      role = role.value
      members = [
        "serviceAccount:${google_service_account.gke_factory.email}",
      ]
    }
  }
  dynamic "binding" {
    for_each = [
      "roles/editor",                        // for viewing services of the project
      "roles/iam.serviceAccountTokenCreator" // for impersonating gke factory service account
    ]
    iterator = role
    content {
      role = role.value
      members = [
        "group:${var.project_factory_email}",
      ]
    }
  }
}
