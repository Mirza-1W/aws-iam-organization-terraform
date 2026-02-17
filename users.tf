resource "aws_iam_user_login_profile" "user_login" {
  for_each = aws_iam_user.users

  user                    = each.value.name
  password_reset_required = true
}
