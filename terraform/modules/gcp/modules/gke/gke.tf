module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "19.0.0"

  project_id                      = var.project_id
  name                            = var.cluster_name
  regional                        = false
  zones                           = [var.zone]
  network                         = module.gke_vpc.network_name
  subnetwork                      = module.gke_vpc.subnets_names[0]
  kubernetes_version              = "1.21.6-gke.1500"
  release_channel                 = "REGULAR"
  horizontal_pod_autoscaling      = false
  enable_vertical_pod_autoscaling = false
  http_load_balancing             = false
  logging_service                 = "none"
  monitoring_service              = "none"
  maintenance_start_time          = "14:00"
  ip_range_pods                   = module.gke_vpc.subnets_secondary_ranges[0][0].range_name
  ip_range_services               = module.gke_vpc.subnets_secondary_ranges[0][1].range_name
  remove_default_node_pool        = true
  node_pools = [
    {
      name               = "minecraft-medium"
      machine_type       = "e2-medium"
      node_locations     = var.zone
      min_count          = 3
      max_count          = 10
      local_ssd_count    = 0
      disk_size_gb       = 10
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      service_account    = var.cluster_sa_email
      auto_repair        = true
      auto_upgrade       = true
      autoscaling        = true
      preemptible        = true
      initial_node_count = 3
    }
  ]
  enable_resource_consumption_export = false
  cluster_autoscaling = {
    enabled       = false
    min_cpu_cores = 0
    max_cpu_cores = 0
    min_memory_gb = 0
    max_memory_gb = 0
    gpu_resources = []
  }
  create_service_account = false
  service_account        = var.cluster_sa_email
}

data "google_client_config" "default" {}
