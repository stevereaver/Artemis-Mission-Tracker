provider "google" {
  project = var.GCP_PROJECT_ID
  region  = var.GCP_REGION
}

# Enable necessary Google Cloud APIs
resource "google_project_service" "run" {
  service = "run.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "artifactregistry" {
  service = "artifactregistry.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "cloudbuild" {
  service = "cloudbuild.googleapis.com"
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
