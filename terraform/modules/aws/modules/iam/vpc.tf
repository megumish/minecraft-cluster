data "aws_iam_policy_document" "vpc_manager" {
  statement {
    actions   = ["CreateVpc", "DeleteVpc"]
    sid       = "VpcManager"
    resources = ["*"]
  }
}

resource "aws_iam_role" "vpc_manager" {
  name               = "vpc-manager"
  path               = "/${var.project.name}/"
  assume_role_policy = data.aws_iam_policy_document.vpc_manager.json
}