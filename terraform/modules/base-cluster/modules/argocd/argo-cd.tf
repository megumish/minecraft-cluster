resource "helm_release" "argo_cd" {
  name       = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "3.31.1"
  namespace  = var.argocd_namespace

  set {
    name  = "server.extraArgs[0]"
    value = "--insecure"
  }
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

# TLSの証明書発行が終わるまで、コメントアウトしてリソースを作らないようにしておく
resource "kubectl_manifest" "argo_cd_ingress_route" {
  yaml_body = yamlencode({
    apiVersion = "traefik.containo.us/v1alpha1"
    kind       = "IngressRoute"
    metadata = {
      name      = "argocd-server"
      namespace = var.argocd_namespace
    }
    spec = {
      entryPoints = ["websecure"]
      routes = [
        {
          kind     = "Rule"
          match    = "Host(`argocd.${var.domain}`)"
          priority = 10
          services = [
            {
              name = "argo-cd-argocd-server"
              port = 80
            }
          ]
        },
        {
          kind     = "Rule"
          match    = "Host(`argocd.${var.domain}`) && Headers(`Content-Type`, `application/grpc`)"
          priority = 11
          services = [
            {
              name   = "argo-cd-argocd-server"
              port   = 80
              scheme = "h2c"
            }
          ]
        }
      ]
      tls = {
        secretName = var.certificate_secret_name
      }
    }
  })
}

