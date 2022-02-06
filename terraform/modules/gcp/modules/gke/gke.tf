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
  horizontal_pod_autoscaling = false
  http_load_balancing        = false
  maintenance_start_time     = "14:00"
  ip_range_pods              = local.po_secondary_ip_range_name
  ip_range_services          = local.svc_secondary_ip_range_name
  remove_default_node_pool   = true
  node_pools = [
    {
      name = var.cluster_name
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
