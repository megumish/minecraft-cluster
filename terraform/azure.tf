module "azure" {
  source = "./modules/azure"

  subscription_id  = var.subscription_id
  tenant_id        = var.tenant_id
  client_id        = var.client_id
  client_secret    = var.client_secret
  project_name     = var.project_name
  project_location = var.project_location
}
