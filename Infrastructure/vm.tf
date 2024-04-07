resource "google_compute_instance" "vm-private" {
    name = "bastion-instance"
    machine_type = var.machine_type
    zone = var.zone
    project = var.project
    allow_stopping_for_update = true
    tags = ["bastion","http"]
    
    boot_disk {
        initialize_params {
            image = "ubuntu-2204-jammy-v20240319"
        }
    }
    
      metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential apache2"
    network_interface {
        network = module.network.vpc_network.name
        subnetwork = module.network.bastion-subnet.name
        access_config {
      // Ephemeral public IP
    }

    }
        
}