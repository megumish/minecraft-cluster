module "cert_manager" {
  source = "../base-cluster/modules/cert-manager"

  kube_host                   = module.lke.kube_host
  kube_token                  = module.lke.kube_token
  kube_cluster_ca_certificate = module.lke.kube_cluster_ca_certificate

  certificate_name = local.certificate_name
  ns_domain_map = {
    "${local.traefik_namespace}" = "traefik.${var.domain}"
    "${local.argocd_namespace}"  = "argocd.${var.domain}"
  }
  issuer_email = var.soa_email
  environment  = var.environment

  traefik_class = module.traefik.class_name
}
