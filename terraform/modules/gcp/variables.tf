variable "folder_name" {
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

variable "current_user_email" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "project_owners" {
  type = list(object(
    {
      type  = string
      email = string
    }
  ))
}

variable "domain" {
  type = string
}

variable "source_repo" {
  type = string
}

variable "target_revision" {
  type = string
}
