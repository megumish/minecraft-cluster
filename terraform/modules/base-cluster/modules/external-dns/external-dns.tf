resource "helm_release" "external-dns" {
  name       = "external-dns"
  repository = "https://kubernetes-sigs.github.io/external-dns/"
  chart      = "external-dns"
  version    = "1.7.1"
  namespace  = var.external_dns_namespace
  values = [
    <<EOF
sources:
  - ingress
EOF
  ]

  set {
    name  = "logLevel"
    value = "debug"
  }

  set {
    name  = "domainFilters[0]"
    value = var.domain
  }
  set {
    name  = "provider"
    value = var.cloud_provider
  }

  dynamic "set" {
    for_each = var.cloud_provider == "linode" ? [""] : []
    content {
      name  = "env[0].name"
      value = "LINODE_TOKEN"
    }
  }

  dynamic "set" {
    for_each = var.cloud_provider == "linode" ? [""] : []
    content {
      name  = "env[0].valueFrom.secretKeyRef.name"
      value = local.linode_secret_name
    }
  }

  dynamic "set" {
    for_each = var.cloud_provider == "linode" ? [""] : []
    content {
      name  = "env[0].valueFrom.secretKeyRef.key"
      value = local.linode_secret_api_token_key
    }
  }

  create_namespace = "true"

  depends_on = [kubernetes_secret_v1.linode_secret]
}
