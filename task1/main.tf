provider "google" {
  project = "devops-test-428403"
  region  = "asia-south1"
}

data "google_artifact_registry_repository" "repo" {
  location      = "asia-south1"
  repository_id = "devops-test"
}

resource "google_cloud_run_service" "default" {
  name     = "hello-world-service"
  location = "asia-south1"

  template {
    spec {
      containers {
        image = "asia-south1-docker.pkg.dev/devops-test-428403/devops-test/hello-world"
        ports {
          container_port = 3000
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

resource "google_cloud_run_service_iam_member" "noauth" {
  location = google_cloud_run_service.default.location
  service  = google_cloud_run_service.default.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
