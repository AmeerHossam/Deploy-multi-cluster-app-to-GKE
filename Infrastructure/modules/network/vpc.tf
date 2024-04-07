resource "google_compute_network" "vpc_network" {
    name = "demo-vpc"
    routing_mode = "GLOBAL"
    auto_create_subnetworks = false
}