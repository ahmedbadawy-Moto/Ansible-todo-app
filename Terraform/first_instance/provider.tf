
variable "path" {default = "/home/centos/Terraform/Credentials"}
provider "google" {
    project="gcp-terraform-udemy"
    region="europe-west-a"
    credentials = "${file("${var.path}/gcp-terraform-udemy-secrets.json")}"
}