resource "argocd_project" "bootstrap" {
  metadata {
    name      = local.bootstrap_project_name
    namespace = var.argocd_namespace
  }

  spec {
    description  = "bootstrap project"
    source_repos = ["https://github.com/megumish/minecraft-cluster"]

    destination {
      server    = "https://kubernetes.default.svc"
      namespace = var.argocd_namespace
    }
    cluster_resource_blacklist {
      group = "*"
      kind  = "*"
    }
    namespace_resource_blacklist {
      group = "*"
      kind  = "*"
    }
    namespace_resource_whitelist {
      group = "argoproj.io/v1alpha1"
      kind  = "Application"
    }
    orphaned_resources {
      warn = false
    }
  }

  depends_on = [helm_release.argo_cd]
}
