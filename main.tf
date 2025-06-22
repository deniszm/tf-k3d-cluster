resource "k3d_cluster" "this" {
  name    = var.K3D_CLUSTER_NAME
  servers = 1
  agents  = var.K3D_AGENTS
  image   = "rancher/k3s:v1.32.5-k3s1"

  kubeconfig {
    update_default_kubeconfig = true
    switch_current_context    = true
  }
}