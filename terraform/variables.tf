variable "domain" {
  type = string
}

variable "soa_email" {
  type = string
}

variable "source_repo" {
  type = string
}

variable "target_revision" {
  type = string
}

// gcp
variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "budget_amount" {
  type = number
}

variable "organization_id" {
  type = string
}

variable "billing_account_id" {
  type = string
}
