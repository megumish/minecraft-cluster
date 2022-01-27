module "lke" {
  source      = "./modules/lke"
  environment = var.environment
  domain      = var.domain
  soa_email   = var.soa_email
}
