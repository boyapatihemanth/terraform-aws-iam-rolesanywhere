data "aws_iam_policy_document" "ishika_rolesanywhere_trust" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
      "sts:SetSourceIdentity"
    ]
    principals {
      identifiers = ["rolesanywhere.amazonaws.com"]
      type        = "Service"
    }
    effect = "Allow"
    condition {
      test     = "ArnEquals"
      values   = [aws_rolesanywhere_trust_anchor.ishika_rolesanywhere_trust_anchor.arn]
      variable = "aws:SourceArn"
    }
  }
}

data "aws_iam_policy_document" "ishika_rolesanywhere_iam_policy_permissions" {
  statement {
    actions = ["*"]
    effect = "Allow"
    resources = ["*"]
  }
}