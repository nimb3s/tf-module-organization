terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.67.0"
    }
  }
}

provider "aws" {
  access_key = "test"
  secret_key = "test"
  region     = "us-east-1"
  s3_use_path_style           = false
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    organizations  = "http://localhost:4566"
  }
}

module "nimb3s_root_org" {
  source = "../../modules/organization"
  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
    "sso.amazonaws.com"
    ]
  feature_set = "ALL"
}

module "nimb3s_org_unit_development" {
  source = "../../modules/organizational-unit"
  parent_org_unit_id = module.nimb3s_root_org.id
  name = "development-ou"
  accounts = {
    development = {
      name = "development-acc"
      email = "${var.email_username}+aws-development@gmail.com"
      role_name = "asdf"
      close_on_deletion = true
      iam_user_access_to_billing = "ALLOW"
    }
    qa = {
      name = "qa-acc"
      email = "${var.email_username}+aws-qa@gmail.com"
      role_name = "asdf"
      close_on_deletion = true
      iam_user_access_to_billing = "ALLOW"
    }
    qa2 = {
      name = "qa2-acc"
      email = "${var.email_username}+aws-qa2@gmail.com"
      role_name = "asdf"
      close_on_deletion = true
      iam_user_access_to_billing = "ALLOW"
    }
    stg = {
      name = "stg-acc"
      email = "${var.email_username}+aws-stg@gmail.com"
      role_name = "asdf"
      close_on_deletion = true
      iam_user_access_to_billing = "ALLOW"
    }
  }
}

module "nimb3s_org_unit_production" {
  source = "../../modules/organizational-unit"
  parent_org_unit_id = module.nimb3s_root_org.id
  name = "production-ou"
  accounts = {
    production = {
      name = "production-acc"
      email = "${var.email_username}+aws-production@gmail.com"
      role_name = "asdf"
      close_on_deletion = true
      iam_user_access_to_billing = "ALLOW"
    }
  }
}

output "nimb3s_root_org" {
  value = module.nimb3s_root_org
}

output "nimb3s_org_unit_development" {
  value = module.nimb3s_org_unit_development
}

output "nimb3s_org_unit_production" {
  value = module.nimb3s_org_unit_production
}
