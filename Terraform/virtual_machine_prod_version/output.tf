/*output "machine_type" {
  value = "${google_compute_instance.default.*.machine_type}"
}
output "name" {
  value = "${google_compute_instance.default.*.name}"
}
output "zone" {
  value = "${google_compute_instance.default.*.zone}"
}
*/
# Using join function to concatenate output, here is about instance_id
#output "instance_id" { value = "${join(",",google_compute_instance.default.*.id)}" }

## To use it with one instance only
output "machine_type" {
  value = "${google_compute_instance.default.*.machine_type}"
}
output "name" {
  value = "${google_compute_instance.default.*.name}"
}
output "zone" {
  value = "${google_compute_instance.default.*.zone}"
}