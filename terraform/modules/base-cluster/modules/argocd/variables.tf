variable "kube_host" {
  type = string
}

variable "kube_token" {
  type = string
}

variable "kube_cluster_ca_certificate" {
  type = string
}

variable "project_name" {
  type = string
}

variable "argocd_password" {
  type = string
}

variable "domain" {
  type = string
}

variable "traefik_class" {
  type = string
}

variable "issuer_name" {
  type = string
}

variable "argocd_namespace" {
  type = string
}

variable "certificate_secret_name" {
  type = string
}
