resource "aws_organizations_organizational_unit" "this_org_unit" {
  name      = var.name
  parent_id = var.parent_org_unit_id
  tags = var.tags
}

resource "aws_organizations_account" "this_org_account" {
  parent_id = aws_organizations_organizational_unit.this_org_unit.id

  for_each = var.accounts
  email = each.value.email
  name = lookup(each.value, "name", each.key)

  # optional params
  role_name                  = lookup(each.value, "role_name", "organization-admin")
  close_on_deletion          = lookup(each.value, "close_on_deletion", true)
  iam_user_access_to_billing = lookup(each.value, "iam_user_access_to_billing", "ALLOW")

  # There is no AWS Organizations API for reading role_name
  lifecycle {
    ignore_changes = [role_name]
  }
  tags = var.tags
}