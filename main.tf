resource "k3d_cluster" "this" {
  name    = var.cluster_name
  servers = 1
  agents  = var.agent_count
  image   = "rancher/k3s:v1.32.5-k3s1"

  kubeconfig {
    update_default_kubeconfig = true
    switch_current_context    = true
  }
}