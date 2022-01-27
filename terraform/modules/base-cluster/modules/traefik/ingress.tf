resource "kubernetes_ingress_v1" "nginx" {
  metadata {
    name      = "nginx"
    namespace = var.traefik_namespace
  }

  spec {
    ingress_class_name = "traefik"
    rule {
      host = "traefik.${var.domain}"
      http {
        path {
          backend {
            service {
              name = "nginx"
              port {
                number = 80
              }
            }
          }

          path = "/"
        }
      }
    }
    tls {
      secret_name = var.certificate_secret_name

    }
  }
}

resource "kubernetes_service_v1" "service" {
  metadata {
    name      = "nginx"
    namespace = var.traefik_namespace
  }
  spec {
    selector = {
      app = "nginx"
    }
    port {
      port = 80
    }

    type = "ClusterIP"
  }
}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = "nginx"
    namespace = var.traefik_namespace
    labels = {
      app = "nginx"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          image = "nginx:latest"
          name  = "nginx"
        }
      }
    }
  }
}
