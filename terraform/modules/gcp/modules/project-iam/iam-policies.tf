data "google_iam_policy" "gke_factory_and_project_factory_additional" {
  dynamic "binding" {
    for_each = ["roles/owner"]
    iterator = role
    content {
      role = role.value
      members = [
        "serviceAccount:${google_service_account.gke_factory.email}",
      ]
    }
  }
  dynamic "binding" {
    for_each = ["roles/container.serviceAgent"]
    iterator = role
    content {
      role = role.value
      members = [
        "serviceAccount:${google_service_account.gke_cluster.email}",
        "serviceAccount:${var.project_number}@cloudservices.gserviceaccount.com",
        "serviceAccount:${var.project_number}-compute@developer.gserviceaccount.com",
        "serviceAccount:service-${var.project_number}@container-engine-robot.iam.gserviceaccount.com",
      ]
    }
  }
  dynamic "binding" {
    for_each = [
      "roles/editor",                         // for viewing services of the project
      "roles/iam.serviceAccountTokenCreator", // for impersonating gke factory service account
    ]
    iterator = role
    content {
      role = role.value
      members = [
        "group:${var.project_factory_email}",
      ]
    }
  }
  dynamic "binding" {
    for_each = ["roles/owner"]
    iterator = role
    content {
      role    = role.value
      members = [for owner in var.project_owners : "${owner.type}:${owner.email}"]
    }
  }
}
