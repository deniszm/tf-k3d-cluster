variable "K3D_CLUSTER_NAME" {
  description = "Name of the k3d cluster"
  type        = string
  default     = "demo"
}

variable "K3D_AGENTS" {
  description = "Number of agent nodes"
  type        = number
  default     = 3
}
