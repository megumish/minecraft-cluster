module "project_iam" {
  source = "./modules/project-iam"

  project_id            = module.project.project_id
  project_factory_email = var.current_user_email
  project_owners        = var.project_owners
}
