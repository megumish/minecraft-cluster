variable "kube_host" {
  type = string
}

variable "kube_token" {
  type = string
}

variable "kube_cluster_ca_certificate" {
  type = string
}

variable "ns_domain_map" {
  type = map(string)
}

variable "issuer_email" {
  type = string
}

variable "environment" {
  type = string
}

variable "traefik_class" {
  type = string
}

variable "certificate_name" {
  type = string
}
