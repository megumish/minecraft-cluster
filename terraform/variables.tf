variable "linode_token" {
  type    = string
  default = ""
}

variable "environment" {
  type = string
}

variable "argocd_password" {
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

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "client_id" {
  type = string
}
