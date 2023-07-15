output "id" {
  description = "Identifier of the root"
  value       = resource.aws_organizations_organization.this.roots[0].id
}

output "arn" {
  description = "ARN of the organization"
  value       = resource.aws_organizations_organization.this.roots[0].arn
}

output "accounts" {
  description = "List of organization accounts including the master account. For a list excluding the master account, see the non_master_accounts attribute. All elements have these attributes: arn - ARN of the account; email - Email of the account; id - Identifier of the account; name - Name of the account; status - Current status of the account"
  value       = resource.aws_organizations_organization.this.accounts
}