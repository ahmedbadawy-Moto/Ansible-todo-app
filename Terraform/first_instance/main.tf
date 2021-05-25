/*
## To create multiple VMs instances based on a counter
resource "google_compute_instance" "default"{
    count = "${length(var.name_count)}"
    name = "list-0${count.index+1}"
    machine_type = "${var.machine_type["dev"]}" # this is old way to use variables
    zone = "europe-west2-a"

    boot_disk {
      initialize_params {
          image = var.image             # this is new way to use variables
      }
    }

    network_interface {
      network = "default"
    }

    service_account {
      scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }

}
*/
## To create one VM instance based on a counter
resource "google_compute_instance" "default"{
    count = 1
    name = "list-0${count.index+1}"
    machine_type = "${var.machine_type["dev"]}" # this is old way to use variables
    zone = "europe-west2-a"

    boot_disk {
      initialize_params {
          image = var.image             # this is new way to use variables
      }
    }

    network_interface {
      network = "default"
    }

    service_account {
      scopes = ["userinfo-email", "compute-ro", "storage-ro"]
      
    }
    ## Terraform first will create "second" and then get back to the default to create it
    depends_on = [google_compute_instance.second]

}

resource "google_compute_instance" "second"{
    count = 1
    name = "list-0${count.index+1}"
    machine_type = "${var.machine_type["dev"]}" # this is old way to use variables
    zone = "europe-west2-a"

    boot_disk {
      initialize_params {
          image = var.image             # this is new way to use variables
      }
    }

    network_interface {
      network = "default"
    }

    service_account {
      scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }

}