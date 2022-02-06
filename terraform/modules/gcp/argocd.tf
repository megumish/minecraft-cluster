module "argocd" {
  source = "../base-cluster/modules/argocd"

  kube_host                    = module.gke.kube_host
  kube_token                   = module.gke.kube_token
  kube_cluster_ca_certificate  = module.gke.kube_cluster_ca_certificate
  domain                       = var.domain
  source_repo                  = var.source_repo
  target_revision              = var.target_revision
  cloud_provider_storage_class = local.cloud_provider_storage_class
  argocd_namespace             = local.argocd_namespace
}
