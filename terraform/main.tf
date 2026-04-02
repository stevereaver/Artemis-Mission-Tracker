provider "google" {
  project = var.GCP_PROJECT_ID
  region  = var.GCP_REGION
}

terraform {
  backend "gcs" {}
}

# Enable necessary Google Cloud APIs
resource "google_project_service" "run" {
  service            = "run.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "resourcemanager" {
  service            = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "artifactregistry" {
  service            = "artifactregistry.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "cloudbuild" {
  service            = "cloudbuild.googleapis.com"
  disable_on_destroy = false
}

# Create the Artifact Registry repository for Docker images
resource "google_artifact_registry_repository" "artemis_images" {
  location      = var.GCP_REGION
  repository_id = var.GCP_REPOSITORY
  description   = "Docker Artifact Registry for Artemis Tracker"
  format        = "DOCKER"

  depends_on = [google_project_service.artifactregistry]
}

# Create the GCS bucket for Terraform remote state
resource "google_storage_bucket" "state_bucket" {
  name          = var.GCP_STATE_BUCKET
  location      = var.GCP_REGION
  force_destroy = false
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }
  uniform_bucket_level_access = true
}

# Create the Cloud Run service
resource "google_cloud_run_v2_service" "artemis_tracker" {
  name                = var.GCP_SERVICE_NAME
  location            = var.GCP_REGION
  ingress             = "INGRESS_TRAFFIC_ALL"
  deletion_protection = false

  template {
    containers {
      image = var.GCP_IMAGE
      ports {
        container_port = 8080
      }
    }
  }

  depends_on = [google_project_service.run]
}

# Allow public access to the Cloud Run service
resource "google_cloud_run_v2_service_iam_member" "public_access" {
  name     = google_cloud_run_v2_service.artemis_tracker.name
  location = google_cloud_run_v2_service.artemis_tracker.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

output "service_url" {
  value       = google_cloud_run_v2_service.artemis_tracker.uri
  description = "The URL of the deployed Cloud Run service"
}
