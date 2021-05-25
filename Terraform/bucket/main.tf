
resource "google_storage_bucket" "bucket_01" {
    count = 1
    name = "${var.bucket_name}"
    location = "${var.location}"
    storage_class = "${var.storage}"

    labels = {
        name = "${var.bucket_name}"
        location = "${var.location}"
    }

    versioning {
        enabled = true
    }
}