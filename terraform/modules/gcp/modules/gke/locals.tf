locals {
  po_secondary_ip_range_name  = "gke-po-ip-range"
  svc_secondary_ip_range_name = "gke-svc-ip-range"
  node_pools = [
    {
      name           = "minecraft-medium0"
      node_locations = "${var.region}-a"
    },
    {
      name           = "minecraft-medium1"
      node_locations = "${var.region}-b"
    },
    {
      name           = "minecraft-medium2"
      node_locations = "${var.region}-c"
    }
  ]
  node_pool_default = {
    machine_type       = "e2-medium"
    min_count          = 1
    max_count          = 2
    local_ssd_count    = 0
    disk_size_gb       = 20
    disk_type          = "pd-standard"
    image_type         = "COS_CONTAINERD"
    service_account    = var.cluster_sa_email
    auto_repair        = true
    auto_upgrade       = true
    autoscaling        = true
    preemptible        = true
    initial_node_count = 1
  }

}
