terraform {
  required_providers {
    linode = {
      source = "linode/linode"
    }
  }
}

resource "linode_lke_cluster" "main_cluster" {
  label       = "minecraft-${var.environment}"
  k8s_version = "1.22"
  region      = "ap-northeast"
  tags        = [var.environment]

  pool {
    type  = "g6-standard-2"
    count = 1

    autoscaler {
      min = 1
      max = 10
    }
  }
}
