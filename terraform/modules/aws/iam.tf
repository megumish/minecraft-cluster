
module "iam" {
  source = "./modules/iam"
  providers = {
    aws = aws.bootstrap
  }

  project = local.bootstrap_project
}
