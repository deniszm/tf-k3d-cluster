variable "cluster_name" {
  description = "Name of the k3d cluster"
  type        = string
  default     = "demo"
}

variable "agents" {
  description = "Number of agent nodes"
  type        = number
  default     = 3
}
