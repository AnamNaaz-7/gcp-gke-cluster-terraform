project_id   = "gke-terraform-500607"
region       = "us-central1"
cluster_name = "gke-cluster-demo"

network    = "default"
subnetwork = "default"

ip_range_pods     = "pods-range"
ip_range_services = "services-range"

node_pools = [
  {
    name         = "default-pool"
    machine_type = "e2-medium"
    min_count    = 1
    max_count    = 2
  }
]
