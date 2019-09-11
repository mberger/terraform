resource "google_compute_instance" "firstserver" {
    name = "thefirstserver"
    machine_type = "n1-standard-1"
    zone = "us-east1-b"  

    tags = ["foo", "bar"]

    boot_disk {
        initialize_params { 
            image = "debian-cloud/debian-9"
        }
    }

    network_interface {
        subnetwork = "${google_compute_subnetwork.dev-subnet.name}"
        
        access_config {
            // ephemeral IP
        }
    }

    metadata = {
        foo = "bar"
    }
    service_account {
        scopes = ["userinfo-email", "compute-ro", "storage-ro"]
        }
}