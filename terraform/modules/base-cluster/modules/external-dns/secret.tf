resource "kubernetes_secret_v1" "linode_secret" {
  metadata {
    name      = local.linode_secret_name
    namespace = var.external_dns_namespace
  }

  data = {
    "${local.linode_secret_api_token_key}" = var.linode_token
  }
}
