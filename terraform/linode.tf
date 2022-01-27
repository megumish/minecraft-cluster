module "linode" {
  source = "./modules/linode"

  environment     = var.environment
  linode_token    = var.linode_token
  argocd_password = var.argocd_password
  domain          = var.domain
  soa_email       = var.soa_email
}
