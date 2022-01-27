resource "helm_release" "argo_cd" {
  name             = "argo-cd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "3.31.1"
  namespace        = "argo-cd"
  create_namespace = "true"
}
