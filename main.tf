resource "aws_iam_group" "developers" {
  name = "Developers"
}

resource "aws_iam_group" "qa" {
  name = "QA"
}

resource "aws_iam_group" "helpdesk" {
  name = "Helpdesk"
}



resource "aws_s3_bucket" "dev_bucket" {
  bucket = "technova-dev-bucket-${random_string.suffix.result}"
}

resource "aws_s3_bucket" "qa_bucket" {
  bucket = "technova-qa-bucket-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}

module "userss" {
  source = "./modules/users"


  project_name = "technova"
  developer_group_name  = aws_iam_group.developers.name
  qa_group_name         = aws_iam_group.qa.name
  helpdesk_group_name   = aws_iam_group.helpdesk.name
}


