# resource "kubectl_manifest" "dhall_plugin" {
#   yaml_body = yamlencode({
#     apiVersion = "v1"
#     kind       = "ConfigMap"
#     metadata = {
#       name      = "argocd-cm"
#       namespace = var.argocd_namespace
#       labels = {
#         "app.kubernetes.io/name"    = "argocd-cm"
#         "app.kubernetes.io/part-of" = "argocd"
#       }
#     }
#     data = {
#       configManagementPlugins = <<EOT
# - name: dhall
#   generate:
#     command: [dhall-to-yaml-ng]
#     args: [--file, main.dhall]
#       EOT
#     }
#   })
# 
#   depends_on = [kubectl_manifest.bootstrap_project]
# }
# 
