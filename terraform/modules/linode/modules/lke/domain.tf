resource "linode_domain" "main_domain" {
  type      = "master"
  domain    = var.domain
  soa_email = var.soa_email
  tags      = [var.environment]
}
