module "cert_manager" {
  source  = "terraform-iaac/cert-manager/kubernetes"
  version = "2.4.0"

  cluster_issuer_email = var.issuer_email
  cluster_issuer_name  = "cert-manager-${var.environment}"

  solvers = [{
    http01 = {
      ingress = {
        class = "${var.traefik_class}"
      }
    }
  }]

  certificates = local.certificate_map
}
