
variable "name" {
  type = string
  description = "(Required) Friendly name for the organizational unit"
}

variable "org_root_id" {
    type = string
}

variable "tags" {
    type = map(string)
    default = {
      "Source" = "terraform"
    }
    description = "(Optional) Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}

variable "accounts" {
  description = "Map of AWS accounts to be created inside of that OU"
  type        = any
  default     = {}
}