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
        parameter {
          name  = "targetRevision"
          value = "main"
        }
        parameter {
          name  = "cloudProvider.storageClass"
          value = "linode-block-storage"
        }
      }
    }
    sync_policy {
      automated = {
        prune       = true
        self_heal   = true
        allow_empty = true
      }
      sync_options = [
        "Validate=true",
        "CreateNamespace=true",
        "PrunePropagationPolicy=foreground",
        "PruneLast=true"
      ]
      retry {
        limit = "5"
        backoff = {
          duration     = "30s"
          factor       = "2"
          max_duration = "3m"
        }
      }
    }

  }

  depends_on = [argocd_project.bootstrap]
}
