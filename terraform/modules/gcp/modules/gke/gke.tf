module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "19.0.0"

  project_id                 = var.project_id
  name                       = var.cluster_name
  regional                   = false
  zones                      = [var.zone]
  network                    = module.gke_vpc.network_self_link
  subnetwork                 = module.gke_vpc.subnets_self_links[0]
  kubernetes_version         = "1.21.6-gke.1500"
  release_channel            = "REGULAR"
  horizontal_pod_autoscaling = false
  http_load_balancing        = false
  maintenance_start_time     = "14:00"
  ip_range_pods              = module.gke_vpc.subnets_secondary_ranges[0][0].range_name
  ip_range_services          = module.gke_vpc.subnets_secondary_ranges[0][1].range_name
  remove_default_node_pool   = true
  node_pools = [
    {
      name               = "minecraft"
      machine_type       = "e2-micro"
      node_locations     = var.zone
      min_count          = 1
      max_count          = 1
      local_ssd_count    = 0
      disk_size_gb       = 10
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      service_account    = var.cluster_sa_email
      auto_repair        = true
      auto_upgrade       = true
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
