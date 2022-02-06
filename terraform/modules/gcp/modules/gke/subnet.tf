# resource "google_compute_subnetwork" "gke" {
#   name          = "gke-subnet"
#   ip_cidr_range = "10.0.0.0/8"
#   project       = var.project_id
#   region        = var.region
#   network       = google_compute_network.gke.id
#   secondary_ip_range {
#     range_name    = local.po_secondary_ip_range_name
#     ip_cidr_range = "172.16.0.0/24"
#   }
#   secondary_ip_range {
#     range_name    = local.svc_secondary_ip_range_name
#     ip_cidr_range = "172.17.0.0/24"
#   }
# }

