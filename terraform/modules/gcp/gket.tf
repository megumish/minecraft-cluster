module "gke" {
  source = "./modules/gke"

  project_id           = module.project.project_id
  gke_factory_sa_email = module.project_iam.gke_factory_sa_email
  region               = var.region
}
