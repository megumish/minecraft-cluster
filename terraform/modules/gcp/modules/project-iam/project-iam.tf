resource "google_project_iam_policy" "gke_factory_and_project_factory_additional" {
  project     = var.project_id
  policy_data = data.google_iam_policy.gke_factory_and_project_factory_additional.policy_data
}
