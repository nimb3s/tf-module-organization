variable "name" {
  type = string
  description = "(Required) Friendly name for the member account."
}

variable "email" {
  type = string
  description = "(Required) Friendly name for the member account."
}

variable "id" {
  type = string
  description = "The AWS account id"
}

variable "parent_id" {
    type = string
    default = null
}

variable "role_name" {
  type = string
  description = "(Optional) The name of an IAM role that Organizations automatically preconfigures in the new member account. This role trusts the root account, allowing users in the root account to assume the role, as permitted by the root account administrator. The role has administrator permissions in the new member account. The Organizations API provides no method for reading this information after account creation, so Terraform cannot perform drift detection on its value and will always show a difference for a configured value after import unless ignore_changes is used"
}

variable "tags" {
    type = map(string)
    default = {
      "Source" = "terraform"
    }
    description = "(Optional) Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}

variable "close_on_deletion" {
  type =  bool
  default =  true
}

variable "iam_user_access_to_billing" {
  type = string
  default = null
}