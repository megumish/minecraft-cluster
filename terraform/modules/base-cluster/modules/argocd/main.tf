terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.4.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.13.0"
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = var.kube_host
    token                  = var.kube_token
    cluster_ca_certificate = var.kube_cluster_ca_certificate
  }
}

provider "kubectl" {
  host                   = var.kube_host
  token                  = var.kube_token
  cluster_ca_certificate = var.kube_cluster_ca_certificate
  load_config_file       = false
}
