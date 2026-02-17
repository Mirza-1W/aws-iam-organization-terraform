data "aws_iam_policy_document" "developer_policy" {

  statement {
    actions = [
      "ec2:Describe*",
      "ec2:StartInstances",
      "ec2:StopInstances"
    ]
    resources = ["*"]
  }

  statement {
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:ListBucket"
    ]
    resources = [
      aws_s3_bucket.dev_bucket.arn,
      "${aws_s3_bucket.dev_bucket.arn}/*"
    ]
  }

  statement {
    actions = [
      "logs:Describe*",
      "logs:Get*",
      "logs:List*"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Deny"
    actions = [
      "ec2:TerminateInstances",
      "iam:*"
    ]
    resources = ["*"]
  }
}


resource "aws_iam_policy" "developer_policy" {
  name   = "DeveloperCustomPolicy"
  policy = data.aws_iam_policy_document.developer_policy.json
}

resource "aws_iam_group_policy_attachment" "dev_attach" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.developer_policy.arn
}

data "aws_iam_policy_document" "qa_policy" {

  statement {
    actions = [
      "ec2:Describe*"
    ]
    resources = ["*"]
  }

  statement {
    actions = [
      "s3:*"
    ]
    resources = [
      aws_s3_bucket.qa_bucket.arn,
      "${aws_s3_bucket.qa_bucket.arn}/*"
    ]
  }

  statement {
    actions = [
      "logs:Describe*",
      "logs:Get*",
      "logs:List*"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Deny"
    actions = [
      "ec2:StartInstances",
      "ec2:StopInstances",
      "ec2:TerminateInstances",
      "iam:*"
    ]
    resources = ["*"]
  }
}


resource "aws_iam_policy" "qa_policy" {
  name   = "QACustomPolicy"
  policy = data.aws_iam_policy_document.qa_policy.json
}

resource "aws_iam_group_policy_attachment" "qa_attach" {
  group      = aws_iam_group.qa.name
  policy_arn = aws_iam_policy.qa_policy.arn
}

