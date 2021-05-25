variable  "image" {default ="ubuntu-os-cloud/ubuntu-1604-lts"}

# Using map kind helps with DevOps work to separate Envs.
variable  "machine_type" {
    type = map
    default = {
        "dev" = "n1-standard-1"
        "prod" = "Prod_box_wont_wrok"
        }
    }

variable "name_count" {default= ["server1", "server2", "server3"]}