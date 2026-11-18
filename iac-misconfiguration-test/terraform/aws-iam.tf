data "aws_iam_policy_document" "overbroad" {
  statement {
    # TESTCASE: IAC-009 Wildcard IAM permissions
    actions   = ["*"]
    resources = ["*"]
    effect    = "Allow"
  }
}
