variable "project_id" {}
variable "region" {}
variable "cluster_name" {}

variable "network" {}
variable "subnetwork" {}

variable "ip_range_pods" {}
variable "ip_range_services" {}

variable "node_pools" {
  type = list(object({
    name       = string
    machine_type = string
    min_count  = number
    max_count  = number
  }))
}
