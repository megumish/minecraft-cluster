
module "iam" {
  source = "./modules/iam"
  providers = {
    aws = aws.bootstrap
  }

  project = {
    name = local.bootstrap_project.name
  }
}
