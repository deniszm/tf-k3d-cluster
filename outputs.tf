output "cluster_name" {
  description = "Name of the k3d cluster"
  value       = k3d_cluster.this.name
}

output "endpoint" {
  description = "Kubernetes API server endpoint"
  value       = k3d_cluster.this.credentials[0].host
  sensitive   = true
}

output "client_key" {
  description = "Client private key for cluster authentication"
  value       = k3d_cluster.this.credentials[0].client_key
  sensitive   = true
}

output "ca" {
  description = "Cluster CA certificate"
  value       = k3d_cluster.this.credentials[0].cluster_ca_certificate
  sensitive   = true
}

output "crt" {
  description = "Client certificate for cluster authentication"
  value       = k3d_cluster.this.credentials[0].client_certificate
  sensitive   = true
}

output "kubeconfig_raw" {
  description = "Raw kubeconfig as string"
  value       = k3d_cluster.this.credentials[0].raw
  sensitive   = true
}
