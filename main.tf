provider "google" {
  project = var.project_id
  region  = var.region
}

# ✅ GKE Cluster
resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  networking_mode = "VPC_NATIVE"
}

# ✅ Node Pool (fixed for quota issue)
resource "google_container_node_pool" "primary_nodes" {
  name     = "node-pool"
  location = var.region
  cluster  = google_container_cluster.primary.name

  initial_node_count = 1

  node_config {
    machine_type = "e2-micro"     # ✅ small machine (safe for quota)
    disk_type    = "pd-standard"  # ✅ avoid SSD quota issue
    disk_size_gb = 20             # ✅ keep it small

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
