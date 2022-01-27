module "external_dns" {
  source = "../base-cluster/modules/external-dns"

  kube_host                   = module.lke.kube_host
  kube_token                  = module.lke.kube_token
  kube_cluster_ca_certificate = module.lke.kube_cluster_ca_certificate

  domain                 = var.domain
  cloud_provider         = "linode"
  linode_token           = var.linode_token
  external_dns_namespace = local.external_dns_namespace
}
