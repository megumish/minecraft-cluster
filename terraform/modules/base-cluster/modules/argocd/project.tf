resource "argocd_project" "minecraft" {
  metadata {
    name      = var.project_name
    namespace = var.argocd_namespace
  }

  spec {
    description  = "minecraft project"
    source_repos = ["minecraft-cluster"]

    destination {
      server    = "https://kubernetes.default.svc"
      namespace = var.argocd_namespace
    }
    cluster_resource_blacklist {
      group = "*"
      kind  = "*"
    }
    namespace_resource_whitelist {
      group = "*"
      kind  = "*"
    }
    orphaned_resources {
      warn = true
    }
    role {
      name = "minecraft-user"
      policies = concat([
        "p, proj:${var.project_name}:minecraft-user, applications, get, ${var.project_name}/*, allow",
        ],
        [
          for action in local.deny_manual_actions :
          "p, proj:${var.project_name}:minecraft-user, applications, ${action}, ${var.project_name}/*, deny"
      ])
    }
  }

  depends_on = [helm_release.argo_cd]
}
