resource "kubectl_manifest" "bootstrap_application" {
  yaml_body = yamlencode({
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name       = "bootstrap"
      namespace  = var.argocd_namespace
      finalizers = ["resources-finalizer.argocd.argoproj.io"]
    }

    spec = {
      project = local.bootstrap_project_name

      source = {
        repoURL        = var.source_repo
        targetRevision = var.target_revision
        path           = "bootstrap-jsonnet"
        directory = {
          recurse = true
          jsonnet = {
            tlas = [
              {
                code  = false
                name  = "name1"
                value = "name1"
              },
              {
                code  = false
                name  = "nest/name1"
                value = "name1"
              }
            ]
          }
        }
      }

      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = var.argocd_namespace
      }

      syncPolicy = {
        automated = {
          prune      = true
          selfHeal   = true
          allowEmpty = true
        }
        syncOptions = [
          "Validate=true",
          "CreateNamespace=true",
          "PrunePropagationPolicy=foreground",
          "PruneLast=true"
        ]
        retry = {
          limit = 5
          backoff = {
            duration    = "30s"
            factor      = 2
            maxDuration = "3m"
          }
        }
      }
    }
  })

  depends_on = [kubectl_manifest.bootstrap_project]
}
