module "project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "11.3.1"

  random_project_id = true
  org_id            = var.organization_id
  name              = var.project_name
  billing_account   = var.billing_account_id
  folder_id         = module.folder.id
  group_name        = "project-editor"
  group_role        = "roles/editor"
  create_project_sa = true
  project_sa_name   = "project-service-account"
  activate_apis = [
    "container.googleapis.com"
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
  vpc_service_control_attach_enabled = true
  vpc_service_control_perimeter_name = "vscp-${var.project_name}"
  grant_services_security_admin_role = false
  grant_services_network_role        = false
}
