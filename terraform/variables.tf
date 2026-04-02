variable "GCP_PROJECT_ID" {
  description = "The ID of the Google Cloud project to use."
  type        = string
}

variable "GCP_REGION" {
  description = "The GCP region to deploy to (e.g., us-central1)."
  type        = string
  default     = "us-central1"
}

variable "GCP_SERVICE_NAME" {
  description = "The name of the Cloud Run service."
  type        = string
  default     = "artemis-tracker"
}

variable "GCP_REPOSITORY" {
  description = "The name of the Artifact Registry repository."
  type        = string
  default     = "artemis-images"
}
