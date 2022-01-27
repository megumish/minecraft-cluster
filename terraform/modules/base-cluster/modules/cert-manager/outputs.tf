output "issuer_kind" {
  value = "ClusterIssuer"
}

output "issuer_name" {
  value = module.cert_manager.cluster_issuer_name
}

output "certificates" {
  value = module.cert_manager.certificates
}
