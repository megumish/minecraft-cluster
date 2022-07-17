data "aws_iam_policy_document" "ec2_resource_creator" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = [
      # delete ec2 resources
      "ec2:Delete*",
      # modify ec2 resources
      "ec2:Replace*",
      "ec2:Attach*",
      "ec2:Associate*",
      # list ec2 resources
      "ec2:Describe*",
      "ec2:Get*",
    ]
    condition {
      test     = "ForAnyValue:StringEquals"
      variable = "ec2:ResourceTag/Environment"
      values   = [var.project.name]
    }
    resources = ["*"]
    effect    = "Allow"
    sid       = "Ec2ResourceCreatorAsModifierPolicy"
  }

  statement {
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = [
      # create ec2 resources
      "ec2:Create*",
      "ec2:Attach*",
      "ec2:Associate*",
    ]
    resources = ["*"]
    effect    = "Allow"
    sid       = "Ec2ResourceCreatorAsCreatorPolicy"
  }
}

data "aws_iam_policy_document" "ec2-resource-creator-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]
    sid     = "Ec2ResourceCreatorAssumeRolePolicy"
  }
}


resource "aws_iam_role" "ec2_resource_creator" {
  name               = "ec2-resource-creator"
  path               = "/${var.project.name}/"
  assume_role_policy = data.aws_iam_policy_document.ec2-resource-creator-assume-role-policy.json
  inline_policy {
    name   = "ec2-resource-creator-policy"
    policy = data.aws_iam_policy_document.ec2_resource_creator.json
  }
}
