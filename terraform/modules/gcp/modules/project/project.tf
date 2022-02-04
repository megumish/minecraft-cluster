module "project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "11.3.1"

  random_project_id = true
  org_id            = var.organization_id
  name              = var.project_name
  billing_account   = var.billing_account_id
  folder_id         = module.folder.id
  create_project_sa = true
  project_sa_name   = "project-service-account"
  activate_apis = [
    "container.googleapis.com",
    "iam.googleapis.com",
    "billingbudgets.googleapis.com",
    "serviceusage.googleapis.com",
    "admin.googleapis.com"
  ]
  activate_api_identities = [
    {
      api   = "container.googleapis.com"
      roles = ["roles/container.clusterAdmin"]
    }
  ]
  labels                             = {}
  default_service_account            = "delete"
  budget_amount                      = var.budget_amount
  grant_services_security_admin_role = false
  grant_services_network_role        = false
}
