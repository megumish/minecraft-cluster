module "gke" {
  source = "./modules/gke"

  project_id           = module.project.project_id
  gke_factory_sa_email = module.project_iam.gke_factory_sa_email
  region               = var.region
  zone                 = var.zone
  cluster_name         = var.cluster_name
  cluster_sa_email     = module.project_iam.cluster_sa_email
  project_iam_etag     = module.project_iam.etag
}
