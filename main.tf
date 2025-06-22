resource "k3d_cluster" "this" {
  name    = var.cluster_name
  servers = 1
  agents  = var.agents

  kubeconfig {
    update_default_kubeconfig = true
    switch_current_context    = true
  }
}
