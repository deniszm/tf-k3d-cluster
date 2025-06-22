variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
  default     = "demo"
}

variable "agent_count" {
  description = "Number of agent nodes"
  type        = number
  default     = 3
}
