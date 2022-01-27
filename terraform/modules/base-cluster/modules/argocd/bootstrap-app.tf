resource "argocd_application" "bootstrap" {
  metadata {
    name      = "bootstrap"
    namespace = var.argocd_namespace
  }

  spec {
    project = var.project_name

    destination {
      server    = "https://argocd.minecraft.megumi.sh"
      namespace = "bootstrap"
    }

    source {
      repo_url        = "http://github.com/megumish/minecraft-cluster"
      path            = "bootstrap"
      target_revision = "main"
    }
  }

  depends_on = [argocd_project.minecraft]
}
