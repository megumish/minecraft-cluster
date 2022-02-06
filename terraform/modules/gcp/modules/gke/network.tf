module "gke-vpc" {
  source  = "terraform-google-modules/network/google"
  version = "4.1.0"

  project_id              = var.project_id
  network_name            = "gke-vpc"
  description             = "vpc for gke"
  routing_mode            = "GLOBAL"
  shared_vpc_host         = false
  auto_create_subnetworks = false
  mtu                     = 1460
  subnets = [
    {
      subnet_name           = "gke-subnet"
      subnet_ip             = "10.0.0.0/8"
      subnet_region         = var.region
      subnet_private_access = true
      subnet_flow_logs      = false
    }
  ]
  secondary_ranges = {
    "gke-subnet" = [
      {
        range_name    = local.po_secondary_ip_range_name
        ip_cidr_range = "172.16.0.0/16"
      },
      {
        range_name    = local.svc_secondary_ip_range_name
        ip_cidr_range = "172.17.0.0/16"
      }
    ]
  }
  delete_default_internet_gateway_routes = false
  routes                                 = []
  firewall_rules = [
    {
      name      = "ingress-internet"
      direction = "INGRESS"
      priority  = 0
      ranges    = ["0.0.0.0/0"]
      allow     = []
      deny = [{
        protocol = "all"
        ports    = []
      }]
    }
  ]
}
