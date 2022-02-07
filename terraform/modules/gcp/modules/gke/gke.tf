module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "19.0.0"

  project_id                         = var.project_id
  name                               = var.cluster_name
  regional                           = false
  zones                              = [var.zone]
  network                            = module.gke_vpc.network_name
  subnetwork                         = module.gke_vpc.subnets_names[0]
  kubernetes_version                 = "1.21.6-gke.1500"
  release_channel                    = "REGULAR"
  horizontal_pod_autoscaling         = true
  enable_vertical_pod_autoscaling    = true
  http_load_balancing                = false
  logging_service                    = "none"
  monitoring_service                 = "none"
  maintenance_start_time             = "14:00"
  ip_range_pods                      = module.gke_vpc.subnets_secondary_ranges[0][0].range_name
  ip_range_services                  = module.gke_vpc.subnets_secondary_ranges[0][1].range_name
  remove_default_node_pool           = true
  node_pools                         = [for np in local.node_pools : merge(local.node_pool_default, np)]
  enable_resource_consumption_export = false
  cluster_autoscaling = {
    enabled       = false
    min_cpu_cores = 1
    max_cpu_cores = 100
    min_memory_gb = 1
    max_memory_gb = 100
    gpu_resources = []
  }
  create_service_account = false
  service_account        = var.cluster_sa_email
}

data "google_client_config" "default" {}
