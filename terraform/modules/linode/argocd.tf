module "argocd" {
  source = "../base-cluster/modules/argocd"

  kube_host                   = module.lke.kube_host
  kube_token                  = module.lke.kube_token
  kube_cluster_ca_certificate = module.lke.kube_cluster_ca_certificate
  project_name                = "minecraft"
  argocd_password             = var.argocd_password
  domain                      = var.domain

  traefik_class           = module.traefik.class_name
  issuer_name             = module.cert_manager.issuer_name
  argocd_namespace        = local.argocd_namespace
  certificate_secret_name = module.cert_manager.certificates["argocd.${var.domain}-${local.certificate_name}"].secret_name
}
