module "project" {
  source = "./modules/project"

  organization_id    = var.organization_id
  folder_name        = var.folder_name
  project_name       = var.project_name
  billing_account_id = var.billing_account_id
  budget_amount      = var.budget_amount
}
