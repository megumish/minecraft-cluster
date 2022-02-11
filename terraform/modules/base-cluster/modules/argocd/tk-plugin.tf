resource "kubectl_manifest" "tk_plugin" {
  yaml_body = yamlencode({
    apiVersion = "v1"
    kind       = "ConfigMap"
    metadata = {
      name      = "argocd-cm"
      namespace = var.argocd_namespace
      labels = {
        "app.kubernetes.io/name"    = "argocd-cm"
        "app.kubernetes.io/part-of" = "argocd"
      }
    }
    data = {
      configManagementPlugins = <<EOT
- name: tanka
  init:
    command: [jb, update]
  generate:
    command: [sh, -c]
    args: [tk, show, environments/$TK_ENVIRONMENT]
      EOT
    }
  })

  depends_on = [kubectl_manifest.bootstrap_project]
}

