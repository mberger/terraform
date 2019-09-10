resource "google_compute_instance" "firstserver" {
    name = "thefirstserver"
    machine_type = "n1-standart-1"
    zone = "us-east-1a"  

    boot_disk {
        initialize_params { 
            image = "debian-cloud/debian-8"
        }
    }

    network_interface {
        subnetwork_project = "${google_compute_network.our_dev_network.name}"
        access_config {
        }
    }

    service_account {
        scopes = ["userinfo-email", "compute-ro", "storage-ro"]
        }
}