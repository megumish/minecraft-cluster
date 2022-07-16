terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}

module "aws" {
  source = "./module/aws"

  project_name = var.project_name
}
