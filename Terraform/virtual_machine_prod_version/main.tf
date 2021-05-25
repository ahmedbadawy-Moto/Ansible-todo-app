
## To create one VM instance based on a counter

resource "google_compute_instance" "default"{
    count = "${var.machine_count}"
    name = "list-0${count.index+1}"
    machine_type = "${var.machine_type}"
    zone = "${var.zone}"
    can_ip_forward = "false"
    description = "This is our Virtual Machine"

    tags = ["allow-http", "allow-https"]  # FIREWALL

    boot_disk {
      initialize_params {
          image = var.image             # this is new way to use variables
          size = 20                     # Default disk size is 10 GB
      }
    }

    labels = {
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

resource "google_compute_disk" "default" {
  name = "test-disk"
  type = "pd-ssd"
  zone = "${var.zone}"
  size = 10
}

# attachment is to till which disc and to which instance you want to attach it.
resource "google_compute_attached_disk" "default" {
  disk = "${google_compute_disk.default.self_link}"    #self_link means it`s within this file 
  instance = "${google_compute_instance.default[0].self_link}"
}