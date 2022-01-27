resource "argocd_repository" "megumish_minecraft_cluster" {
  repo = "https://github.com/megumish/minecraft-cluster"
  name = "minecraft-cluster"

  depends_on = [helm_release.argo_cd]
}
