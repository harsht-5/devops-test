provider "google" {
  project = var.project
  region  = var.region
}

resource "google_compute_network" "vpc_network" {
  name                    = "demo-vpc"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  description             = "VPC for Cloud Run service"
}

resource "google_compute_subnetwork" "subnets" {
  count                = length(var.subnet_cidrs)
  name                 = "demo-subnet-${count.index}"
  ip_cidr_range        = var.subnet_cidrs[count.index]
  region               = var.region
  network              = google_compute_network.vpc_network.self_link
  private_ip_google_access = true
}

resource "google_cloud_run_service" "cloud_run_service" {
  name     = var.cloud_run_service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.cloud_run_image
        ports {
          container_port = 3000
        }

        resources {
          limits = {
            memory = var.cloud_run_memory
          }
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_member" "invoker" {
  service = google_cloud_run_service.cloud_run_service.name
  location = google_cloud_run_service.cloud_run_service.location
  role = "roles/run.invoker"
  member = "allUsers"
}
