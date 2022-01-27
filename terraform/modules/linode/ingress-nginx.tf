module "ingress_nginx" {
  source = "../base-cluster/modules/ingress-nginx"

  kube_host                   = module.lke.kube_host
  kube_token                  = module.lke.kube_token
  kube_cluster_ca_certificate = module.lke.kube_cluster_ca_certificate
}
