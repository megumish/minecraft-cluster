module "gke" {
  source = "./modules/gke"

  project_id = module.project.project_id
}
