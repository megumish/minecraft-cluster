module "linode" {
  source = "./modules/linode"

  environment  = var.environment
  linode_token = var.linode_token
}
