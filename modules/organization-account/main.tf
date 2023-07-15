resource "aws_organizations_account" "this" {
  parent_id = var.parent_org_unit_id
  name  = var.name
  email = var.email
  iam_user_access_to_billing = var.iam_user_access_to_billing == "" ? null : var.iam_user_access_to_billing
  role_name = var.role_name == "" ? null : var.role_name
  close_on_deletion = var.close_on_deletion
  tags = var.tags
  # There is no AWS Organizations API for reading role_name
  lifecycle {
    ignore_changes = [role_name]
  }
}

