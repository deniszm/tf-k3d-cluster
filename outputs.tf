output "kubeconfig_path" {
  description = "Path to the kubeconfig file"
  value       = k3d_cluster.this.kubeconfig[0].config_path
}

output "cluster_name" {
  description = "Name of the k3d cluster"
  value       = k3d_cluster.this.name
}

output "endpoint" {
  description = "Kubernetes API server endpoint"
  value       = k3d_cluster.this.credentials[0].host
}

output "client_key" {
  description = "Client private key for cluster authentication"
  value       = k3d_cluster.this.credentials[0].client_key
  sensitive   = true
}

output "ca" {
  description = "Cluster CA certificate"
  value       = k3d_cluster.this.credentials[0].cluster_ca_certificate
}

output "crt" {
  description = "Client certificate for cluster authentication"
  value       = k3d_cluster.this.credentials[0].client_certificate
}
