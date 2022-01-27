module "traefik" {
  source = "../base-cluster/modules/traefik"

  kube_host                   = module.lke.kube_host
  kube_token                  = module.lke.kube_token
  kube_cluster_ca_certificate = module.lke.kube_cluster_ca_certificate

  domain                  = var.domain
  certificate_secret_name = module.cert_manager.certificates["traefik.${var.domain}-${local.certificate_name}"].secret_name
  traefik_namespace       = local.traefik_namespace
}
