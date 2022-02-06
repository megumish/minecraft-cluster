module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "19.0.0"

  project_id                 = var.project_id
  name                       = var.cluster_name
  regional                   = false
  zones                      = [var.zone]
  network                    = basename(google_compute_network.gke.id)
  subnetwork                 = basename(google_compute_subnetwork.gke.id)
  kubernetes_version         = "1.21.6-gke.1500"
  release_channel            = "REGULAR"
  horizontal_pod_autoscaling = false
  http_load_balancing        = false
  maintenance_start_time     = "14:00"
  ip_range_pods              = local.po_secondary_ip_range_name
  ip_range_services          = local.svc_secondary_ip_range_name
  remove_default_node_pool   = true
  node_pools = [
    {
      name         = var.cluster_name
      auto_repair  = true
      auto_upgrade = true
    },
    {
      name               = "${random_id.node_name.keepers.cluster_name}-${random_id.node_name.hex}"
      machine_type       = "e2-micro"
      node_locations     = var.zone
      min_count          = 1
      max_count          = 1
      local_ssd_count    = 0
      disk_size_gb       = 10
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      auto_repair        = true
      auto_upgrade       = true
      service_account    = var.cluster_sa_email
      preemptible        = true
      initial_node_count = 1
    }
  ]
  enable_resource_consumption_export = false
  cluster_autoscaling = {
    enabled       = true
    min_cpu_cores = 1
    max_cpu_cores = 1
    min_memory_gb = 1
    max_memory_gb = 1
    gpu_resources = []
  }
  create_service_account = false
  service_account        = var.cluster_sa_email
}

resource "random_id" "node_name" {
  keepers = {
    # Generate a new id each time we switch to a new AMI id
    cluster_name = var.cluster_name
  }

  byte_length = 8
}
