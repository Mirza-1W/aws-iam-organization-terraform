locals {
  developers = [
    "dev01", "dev02", "dev03", "dev04", "dev05",
    "dev06", "dev07", "dev08", "dev09", "dev10"
  ]

  qa = [
    "qa01", "qa02", "qa03", "qa04",
    "qa05", "qa06", "qa07", "qa08"
  ]

  helpdesk = [
    "help01", "help02", "help03",
    "help04", "help05", "help06", "help07"
  ]

  all_users = concat(local.developers, local.qa, local.helpdesk)
}


resource "aws_iam_user" "users" {
  for_each = toset(local.all_users)

  name = each.value

  tags = {
    project = var.project_name
  }
}


resource "aws_iam_user_group_membership" "dev_membership" {
  for_each = toset(local.developers)

  user   = each.value
  groups = [var.developer_group_name]
}

resource "aws_iam_user_group_membership" "qa_membership" {
  for_each = toset(local.qa)

  user   = each.value
  groups = [var.qa_group_name]
}

resource "aws_iam_user_group_membership" "help_membership" {
  for_each = toset(local.helpdesk)

  user   = each.value
  groups = [var.helpdesk_group_name]
}

resource "aws_iam_user_login_profile" "user_login" {
  for_each = aws_iam_user.users

  user                    = each.value.name
  password_reset_required = true
}
