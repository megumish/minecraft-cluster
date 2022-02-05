resource "google_container_cluster" "primary" {
  project  = var.project_id
  name     = var.cluster_name
  location = var.zone
  cluster_autoscaling {
    enabled = true
    resource_limits {
      resource_type = "cpu"
      minimum       = 1
      maximum       = 1
    }
    resource_limits {
      resource_type = "memory"
      minimum       = 1
      maximum       = 1
    }
  }
  database_encryption {
    state = "DECRYPTED"
  }
  description                 = "this is the ${var.cluster_name}"
  default_max_pods_per_node   = 110
  enable_binary_authorization = false
  enable_kubernetes_alpha     = false
  enable_tpu                  = false
  enable_legacy_abac          = false
  enable_shielded_nodes       = true
  initial_node_count          = 1
  ip_allocation_policy {
    cluster_secondary_range_name  = local.po_secondary_ip_range_name
    services_secondary_range_name = local.svc_secondary_ip_range_name
  }
  networking_mode = "VPC_NATIVE"
  logging_config {
    enable_components = []
  }
  logging_service = "none"
  monitoring_config {
    enable_components = []
  }
  monitoring_service = "none"
  maintenance_policy {
    daily_maintenance_window {
      start_time = "14:00"
    }
  }
  master_auth {
    client_certificate_config {
      issue_client_certificate = true
    }
  }
  network    = google_compute_network.gke.id
  subnetwork = google_compute_subnetwork.gke.id
  network_policy {
    enabled = false
  }
  release_channel {
    channel = "STABLE"
  }
  remove_default_node_pool = true
  vertical_pod_autoscaling {
    enabled = false
  }
  enable_intranode_visibility = false
  default_snat_status {
    disabled = true
  }
  dns_config {
    cluster_dns       = "PROVIDER_UNSPECIFIED"
    cluster_dns_scope = "DNS_SCOPE_UNSPECIFIED"
  }
}
