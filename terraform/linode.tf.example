module "linode" {
  source = "./modules/linode"

  environment     = var.environment
  linode_token    = var.linode_token
  argocd_password = var.argocd_password
  domain          = var.domain
  soa_email       = var.soa_email
  source_repo     = var.source_repo
  target_revision = var.target_revision
}
