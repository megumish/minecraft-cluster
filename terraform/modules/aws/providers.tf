provider "aws" {
  alias = "bootstrap"
  default_tags {
    tags = {
      Environment = "${var.project_name}-bootstrap"
    }
  }
}
