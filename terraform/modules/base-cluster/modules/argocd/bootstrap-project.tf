resource "kubectl_manifest" "bootstrap_project" {
  yaml_body = yamlencode({
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "AppProject"
    metadata = {
      name       = local.bootstrap_project_name
      namespace  = var.argocd_namespace
      finalizers = ["resources-finalizer.argocd.argoproj.io"]
    }

    spec = {
      description = "Project for bootstrap"
      sourceRepos = [var.source_repo]
      destinations = [
        {
          namespace = var.argocd_namespace
          server    = "https://kubernetes.default.svc"
        }
      ]
      namespaceResourceWhiteList = [
        {
          group = "argoproj.io"
          kind  = "Application"
        },
        {
          group = "argoproj.io"
          kind  = "AppProject"
        }
      ]
      orphanResources = {
        warn = false
      }
    }
  })

  depends_on = [helm_release.argo_cd]
}
