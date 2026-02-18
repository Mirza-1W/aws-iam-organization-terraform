resource "aws_iam_account_password_policy" "strict_policy" {
  minimum_password_length        = 14
  require_uppercase_characters   = true
  require_lowercase_characters   = true
  require_numbers                = true
  require_symbols                = true
  allow_users_to_change_password = true
  password_reuse_prevention      = 10
  max_password_age               = 90
  hard_expiry                    = true
}

data "aws_iam_policy_document" "mfa_enforcement" {
  statement {
    sid    = "DenyAllExceptListedIfNoMFA"
    effect = "Deny"

    not_actions = [
      "iam:CreateVirtualMFADevice",
      "iam:EnableMFADevice",
      "iam:GetUser",
      "iam:ListMFADevices",
      "iam:ListVirtualMFADevices",
      "iam:ResyncMFADevice",
      "sts:GetSessionToken"
    ]

    resources = ["*"]

    condition {
      test     = "BoolIfExists"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["false"]
    }
  }
}

resource "aws_iam_policy" "mfa_enforcement_policy" {
  name   = "EnforceMFA"
  policy = data.aws_iam_policy_document.mfa_enforcement.json
}


resource "aws_iam_group_policy_attachment" "dev_mfa_attach" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.mfa_enforcement_policy.arn
}

resource "aws_iam_group_policy_attachment" "qa_mfa_attach" {
  group      = aws_iam_group.qa.name
  policy_arn = aws_iam_policy.mfa_enforcement_policy.arn
}

resource "aws_iam_group_policy_attachment" "helpdesk_mfa_attach" {
  group      = aws_iam_group.helpdesk.name
  policy_arn = aws_iam_policy.mfa_enforcement_policy.arn
}

