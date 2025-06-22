# Terraform K3D Cluster

This Terraform configuration creates a local Kubernetes cluster using k3d. It provides the same functionality as running `k3d cluster create --agents 3 demo` but with Infrastructure as Code approach.

## Prerequisites

- Docker installed and running
- OpenTofu >= 1.0 or Terraform >= 1.0

**Note**: k3d CLI is **NOT required** - the Terraform provider handles k3d operations directly through Docker.

## Features

- Creates k3d cluster with configurable number of agent nodes
- Automatically updates kubeconfig and switches context
- Provides cluster credentials as outputs (similar to KIND cluster)
- Uses k3s v1.32.5 (latest stable)

## Quick Start

### 1. Initialize and deploy:

```bash
git clone <this-repo>
cd tf-k3d-cluster
tofu init
tofu apply
```

### 2. Verify cluster:

```bash
kubectl get nodes
kubectl cluster-info
```

### 3. Clean up:

```bash
tofu destroy
```

## Configuration

### Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster_name | Name of the cluster | `string` | `"demo"` | no |
| agent_count | Number of agent nodes | `number` | `3` | no |

### Outputs

| Name | Description | Sensitive |
|------|-------------|-----------|
| cluster_name | Name of the cluster | No |
| endpoint | Kubernetes API server endpoint | Yes |
| client_key | Client private key for cluster authentication | Yes |
| ca | Cluster CA certificate | Yes |
| crt | Client certificate for cluster authentication | Yes |

### Example: Customizing the cluster

Edit `variables.tf` defaults or use `-var` flags:

```bash
tofu apply -var="cluster_name=my-cluster" -var="agent_count=5"
```

## Architecture

- **1 Server Node**: Control plane (master)
- **3 Agent Nodes**: Worker nodes (configurable)
- **Network**: Dedicated Docker network
- **Load Balancer**: Managed load balancer
- **Kubernetes Version**: v1.32.5+k3s1

## Contributing

1. Fork the repository
2. Make your changes
3. Test with `tofu plan` and `tofu apply`
4. Submit a pull request