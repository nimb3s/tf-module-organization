variable aws_service_access_principals {
    type = list(string)
    description = "(Optional) List of AWS service principal names for which you want to enable integration with your organization. This is typically in the form of a URL, such as service-abbreviation.amazonaws.com. Organization must have feature_set set to ALL. Some services do not support enablement via this endpoint, see warning in aws docs."
    default = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
    "sso.amazonaws.com"
    ]
}

variable feature_set {
    type = string
    description = "(Optional) Specify \"ALL\" (default) or \"CONSOLIDATED_BILLING\"."
    default = "ALL"
}

variable "enabled_policy_types" {
  description = " List of Organizations policy types to enable in your organization. Valid values are AISERVICES_OPT_OUT_POLICY, BACKUP_POLICY, SERVICE_CONTROL_POLICY, TAG_POLICY"
  type        = list(string)
  default     = null
}
