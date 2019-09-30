resource "google_compute_network" "our_dev_network" {
    name = "devnetwork"
    project = "berger-lab-1"
    auto_create_subnetworks = false
  
}

resource "google_compute_subnetwork" "dev-subnet" {
    name = "dev-subnet"
    ip_cidr_range = "10.0.1.0/24"
    network = "${google_compute_network.our_dev_network.self_link}"
    region = "us-east1"


}
//resource "aws_vpc" "env-example-two" {
 // cidr_block = "10.0.0.0/16"
 // enable_dns_hostnames = true
 //  enable_dns_support = true
//  tags {
//      Name = "terraform-aws-vpc-example-two:"
//  }
//}
