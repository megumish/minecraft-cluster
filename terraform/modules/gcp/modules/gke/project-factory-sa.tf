resource "google_project_iam_policy" "project_factory_additional" {
  project     = var.project_id
  policy_data = data.google_iam_policy.project_factory_additional.policy_data
}

data "google_iam_policy" "project_factory_additional" {
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

resource "time_sleep" "wait_for_applying_project_factory_additional" {
  depends_on = [google_project_iam_policy.project_factory_additional]

  create_duration = "5s"
}
