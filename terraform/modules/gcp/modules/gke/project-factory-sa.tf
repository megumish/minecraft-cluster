resource "google_project_iam_policy" "project_factory_additional" {
  project     = var.project_id
  policy_data = data.google_iam_policy.project_factory_additional.policy_data
}

data "google_iam_policy" "project_factory_additional" {
  dynamic "binding" {
    for_each = ["roles/editor"]
    iterator = role
    content {
      role = role.value
      members = [
        "group:${var.project_factory_email}",
      ]
    }
  }
}
