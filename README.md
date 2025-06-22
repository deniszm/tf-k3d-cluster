# Terraform K3D Cluster Module

This Terraform module creates a local Kubernetes cluster using k3d. The module provides the same functionality as running `k3d cluster create --agents 3 demo` but with Infrastructure as Code approach.

## Prerequisites

- Docker installed and running
- k3d installed (`brew install k3d` on macOS)
- Terraform >= 1.0

## Usage

### Basic usage (equivalent to `k3d cluster create --agents 3 demo`):

```hcl
module "k3d_cluster" {
  source = "git::https://github.com/your-username/tf-k3d-cluster.git"
  
  cluster_name = "demo"
  agents       = 3
}
```

### Custom cluster name and agent count:

```hcl
module "k3d_cluster" {
  source = "git::https://github.com/your-username/tf-k3d-cluster.git"
  
  cluster_name = "my-dev-cluster"
  agents       = 2
}
```

### Using specific version/tag:

```hcl
module "k3d_cluster" {
  source = "git::https://github.com/your-username/tf-k3d-cluster.git?ref=v1.0.0"
  
  cluster_name = "prod-cluster"
  agents       = 5
}
```

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster_name | Name of the k3d cluster | `string` | `"demo"` | no |
| agents | Number of agent nodes | `number` | `3` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster_name | Name of the k3d cluster |
| kubeconfig_path | Path to the kubeconfig file |
| cluster_endpoint | Cluster endpoint URL |

## Commands

### Deploy the cluster:

```bash
terraform init
terraform plan
terraform apply
```

### Connect to the cluster:

```bash
# The kubeconfig is automatically updated
kubectl cluster-info
kubectl get nodes
```

### Destroy the cluster:

```bash
terraform destroy
```

## Complete Example Project

Create a new directory for your project and add these files:

**main.tf:**
```hcl
module "k3d_cluster" {
  source = "git::https://github.com/your-username/tf-k3d-cluster.git"
  
  cluster_name = "my-cluster"
  agents       = 3
}

output "cluster_name" {
  value = module.k3d_cluster.cluster_name
}

output "kubeconfig_path" {
  value = module.k3d_cluster.kubeconfig_path
}
```

**versions.tf:**
```hcl
terraform {
  required_version = ">= 1.0"
  
  required_providers {
    k3d = {
      source  = "pvotal-tech/k3d"
      version = "~> 0.0.7"
    }
  }
}
```

Then run:
```bash
terraform init
terraform apply
```

## Notes

- The cluster automatically updates your kubeconfig and switches context
- Default configuration creates 1 server node and the specified number of agent nodes
- The cluster is accessible from localhost
- To remove the cluster, run `terraform destroy`