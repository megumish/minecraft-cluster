resource "helm_release" "argo_cd" {
  name       = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "3.31.1"
  namespace  = var.argocd_namespace

  values = [
    "${file("${path.module}/argo-cd-values.yaml")}",
  ]

  set {
    name  = "server.logLevel"
    value = "debug"
  }
  set {
    name  = "server.config.url"
    value = "https://argocd.${var.domain}"
  }

  create_namespace = "true"
}
