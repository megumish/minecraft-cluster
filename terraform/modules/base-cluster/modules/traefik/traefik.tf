resource "helm_release" "traefik" {
  name             = "traefik"
  repository       = "https://helm.traefik.io/traefik"
  chart            = "traefik"
  version          = "10.9.1"
  namespace        = var.traefik_namespace
  create_namespace = "true"

  set {
    name  = "logs.general.level"
    value = "DEBUG"
  }
  set {
    name  = "ingressClass.enabled"
    value = "true"
  }
  set {
    name  = "ingressClass.isDefaultClass"
    value = "true"
  }
  set {
    name  = "ports.websecure.tls.enabled"
    value = "true"
  }
  set {
    name  = "providers.kubernetesIngress.publishedService.enabled"
    value = "true"
  }
}
