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
    }
  }

  depends_on = [argocd_project.bootstrap]
}
