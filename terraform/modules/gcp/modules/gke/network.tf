# resource "google_compute_network" "gke" {
#   provider = google.gke_factory
# 
#   project                 = var.project_id
#   name                    = "gke"
#   auto_create_subnetworks = false
# 
#   depends_on = [
#     google_project_iam_policy.gke_factory_and_project_factory_additional
#   ]
# }
# 
