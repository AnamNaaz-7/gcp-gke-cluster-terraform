provider "google" {
  project = var.project_id
  region  = var.region
}

# ✅ GKE Cluster (keep default pool but control it)
resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  deletion_protection = false

  initial_node_count = 1

  node_config {
    machine_type = "e2-micro"

    # ✅ THIS IS THE MAIN FIX
    disk_type    = "pd-standard"
    disk_size_gb = 20

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
