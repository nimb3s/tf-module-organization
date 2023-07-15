output "arn" {
  description = "The ARN for this account."
  value       = aws_organizations_account.this_org_account.arn
}

output "id" {
  description = "The AWS account id"
  value       = aws_organizations_account.this_org_account.id
}

output "name" {
  description = "Friendly name for the member account."
  value       = aws_organizations_account.this_org_account.name
}

output "email" {
  description = "Email address of the owner to assign to the new member account. This email address must not already be associated with another AWS account."
  value       = aws_organizations_account.this_org_account.email
}

output "close_on_deletion" {
  description = "If true, a deletion event will close the account. Otherwise, it will only remove from the organization. This is not supported for GovCloud accounts."
  value       = aws_organizations_account.this_org_account.close_on_deletion
}

output "iam_user_access_to_billing" {
  description = "(Optional) If set to ALLOW, the new account enables IAM users and roles to access account billing information if they have the required permissions. If set to DENY, then only the root user (and no roles) of the new account can access account billing information. If this is unset, the AWS API will default this to ALLOW. If the resource is created and this option is changed, it will try to recreate the account."
  value       = aws_organizations_account.this_org_account.iam_user_access_to_billing
}

output "role_name" {
  description = "(Optional) The name of an IAM role that Organizations automatically preconfigures in the new member account. This role trusts the root account, allowing users in the root account to assume the role, as permitted by the root account administrator. The role has administrator permissions in the new member account. The Organizations API provides no method for reading this information after account creation, so Terraform cannot perform drift detection on its value and will always show a difference for a configured value after import unless ignore_changes is used"
  value       = aws_organizations_account.this_org_account.role_name
}

