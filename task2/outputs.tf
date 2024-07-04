output "vpc_network_name" {
  description = "The name of the VPC network."
  value       = google_compute_network.vpc_network.name
}

output "subnet_names" {
  description = "The names of the subnets."
  value       = [for subnet in google_compute_subnetwork.subnets : subnet.name]
}

output "cloud_run_service_url" {
  description = "The URL of the Cloud Run service."
  value       = google_cloud_run_service.cloud_run_service.status[0].url
}
