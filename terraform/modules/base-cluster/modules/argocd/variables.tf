variable "kube_host" {
  type = string
}

variable "kube_token" {
  type = string
}

variable "kube_cluster_ca_certificate" {
  type = string
}

variable "domain" {
  type = string
}

variable "argocd_namespace" {
  type = string
}

variable "source_repo" {
  type = string
}

variable "target_revision" {
  type = string
}

variable "cloud_provider_storage_class" {
  type = string
}
