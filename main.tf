provider "google" {
  project = var.project_id
  region  = var.region
}

module "gke-cluster" {
  source  = "jetstack/gke-cluster/google"
  version = "0.3.0"

  project_id   = var.project_id
  cluster_name = var.cluster_name
  region       = var.region

  network      = var.network
  subnetwork   = var.subnetwork

  ip_range_pods     = var.ip_range_pods
  ip_range_services = var.ip_range_services

  node_pools = var.node_pools
}
