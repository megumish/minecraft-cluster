module "gcp" {
  source = "./modules/gcp"

  folder_name        = var.environment
  project_name       = var.project_name
  budget_amount      = var.budget_amount
  organization_id    = var.organization_id
  billing_account_id = var.billing_account_id
}
