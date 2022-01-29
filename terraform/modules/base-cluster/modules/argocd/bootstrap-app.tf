resource "argocd_application" "bootstrap" {
  metadata {
    name      = "bootstrap"
    namespace = var.argocd_namespace
  }

  spec {
    project = local.bootstrap_project_name

    destination {
      server    = "https://kubernetes.default.svc"
      namespace = var.argocd_namespace
    }

    source {
      repo_url        = "https://github.com/megumish/minecraft-cluster"
      path            = "bootstrap"
      target_revision = "main"
      helm {
        parameter {
          name  = "gitRepositoryUrl"
          value = "https://github.com/megumish/minecraft-cluster"
        }

        parameter {
          name  = "argocd.namespace"
          value = var.argocd_namespace
        }
      }
    }
    sync_policy {
      automated = {
        prune       = true
        self_heal   = true
        allow_empty = true
      }
      sync_options = []
    }

  }

  depends_on = [argocd_project.bootstrap]
}
