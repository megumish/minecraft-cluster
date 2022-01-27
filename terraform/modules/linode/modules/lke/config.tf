locals {
  config = yamldecode(base64decode(linode_lke_cluster.main_cluster.kubeconfig))

  host                   = local.config.clusters[0].cluster.server
  username               = local.config.users[0].name
  token                  = local.config.users[0].user.token
  cluster_ca_certificate = base64decode(local.config.clusters[0].cluster.certificate-authority-data)
}
