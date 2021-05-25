
## To create one VM instance based on a counter


resource "google_compute_instance" "default"{
    count = 1
    name = "list-0${count.index+1}"
    machine_type = "${var.environment == "production" ? var.machine_type : var.machine_type_dev}" # this is old way to use variables
    zone = "europe-west2-a"
    can_ip_forward = false
    description = "This is our VM with FW Rules"
    tags = [ "allow-http", "allow-https" ] # For firewall usage

    boot_disk {
      initialize_params {
          image = var.image             # this is new way to use variables
          size = 20                     # Default disk size is 10 GB
      }
    }

    labels{
      name = "list-0${count.index+1}"
      machine_type = "${var.environment == "production" ? var.machine_type : var.machine_type_dev}"
    }

    metadata = {
      size = "20"
      foo = "bar"
    }

    # Using metadata we can run startup script/
    metadata_startup_script = "echo hi > /test.txt"

    network_interface {
      network = "default"
    }

    service_account {
      scopes = ["userinfo-email", "compute-ro", "storage-ro"]
      
    }

}
