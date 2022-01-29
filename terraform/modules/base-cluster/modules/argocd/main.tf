terraform {
  required_providers {
    argocd = {
      source  = "oboukili/argocd"
      version = "2.1.0"
    }
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

provider "argocd" {
  server_addr                 = "localhost:8080"
  username                    = "admin"
  password                    = var.argocd_password
  insecure                    = true
  plain_text                  = true
  port_forward                = true
  port_forward_with_namespace = var.argocd_namespace

  kubernetes {
    host                   = var.kube_host
    token                  = var.kube_token
    cluster_ca_certificate = var.kube_cluster_ca_certificate
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
