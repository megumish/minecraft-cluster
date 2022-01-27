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

variable "certificate_secret_name" {
  type = string
}

variable "traefik_namespace" {
  type = string
}
