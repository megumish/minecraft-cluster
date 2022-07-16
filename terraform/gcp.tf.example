module "gcp" {
  source = "./modules/gcp"

  folder_name        = var.environment
  project_name       = var.project_name
  budget_amount      = var.budget_amount
  organization_id    = var.organization_id
  billing_account_id = var.billing_account_id
  current_user_email = var.current_user_email
  region             = var.region
  zone               = var.zone
  cluster_name       = var.cluster_name
  project_owners     = var.project_owners
  domain             = var.domain
  source_repo        = var.source_repo
  target_revision    = var.target_revision
}
