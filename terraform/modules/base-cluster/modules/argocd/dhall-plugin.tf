resource "kubectl_manifest" "dhall_plugin" {
  yaml_body = yamlencode({
    apiVersion = "v1"
    kind       = "ConfigMap"
    metadata = {
      name = "dhal-plugin"
      labels = {
        "app.kubernetes.io/name"    = "argocd-cm"
        "app.kubernetes.io/part-of" = "argocd"
      }
    }
    data = {
      configManagementPlugins = yamlencode(
        [
          {
            name = "dhall"
            generate = {
              command = ["dhall-to-yaml", "--file", "main.dhall"]
            }
          }
        ]
      )
    }
  })

  depends_on = [kubectl_manifest.bootstrap_project]
}
