variable "linode_token" {
  type    = string
  default = ""
}

variable "environment" {
  type = string
}

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

// azure resource info
variable "project_name" {
  type = string
}

variable "project_location" {
  type = string
}

// azure rm
variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}
