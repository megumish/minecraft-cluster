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
        path           = "bootstrap"
        helm = {
          parameters = [
            {
              name  = "argocd.namespace"
              value = var.argocd_namespace
            },
            {
              name  = "gitRepositoryUrl"
              value = var.source_repo
            },
            {
              name  = "targetRevision"
              value = var.target_revision
            },
            {
              name  = "cloudProvider.storageClass"
              value = var.cloud_provider_storage_class
            }
          ]
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
