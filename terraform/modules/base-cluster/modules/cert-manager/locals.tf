locals {
  certificate_map = { for ns, domain in var.ns_domain_map :
    "${domain}-${var.certificate_name}" => {
      dns_names = [domain]
      namespace = ns
      secret_name = "${domain}-tls"
    }
  }
}
