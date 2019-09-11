resource "google_container_cluster" "mykuby" {
  name = "mykubycluster"
  zone = "us-east1-b"
  initial_node_count = "1"
  project = "berger-lab-1"

  additional_zones = [
      "us-east1-c"
  ]

  master_auth {
      password = "password-16-or-more-characters"
      username = "username"
  }

  node_config {
      oauth_scopes = [
          "https://www.googleapis.com/auth/compute",
          "https://www.googleapis.com/auth/devstorage.read_only",
          "https://www.googleapis.com/auth/logging.write",
          "https://www.googleapis.com/auth/monitoring"
      ]


    tags = ["dev", "work"] 
    
    }
}
