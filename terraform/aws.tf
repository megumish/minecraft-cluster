terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}

module "aws" {
  source = "./modules/aws"

  project_name = var.project_name
}
