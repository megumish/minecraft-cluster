module "gke" {
  source = "./modules/gke"

  project_id            = module.project.project_id
  project_factory_email = var.current_user_email
}
