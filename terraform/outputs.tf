output "GCP_PROJECT_ID" {
  value       = var.GCP_PROJECT_ID
  description = "The ID of the GCP project"
}

output "GCP_REGION" {
  value       = var.GCP_REGION
  description = "The GCP region"
}

output "GCP_SERVICE_NAME" {
  value       = var.GCP_SERVICE_NAME
  description = "The Cloud Run service name"
}

output "GCP_REPOSITORY" {
  value       = var.GCP_REPOSITORY
  description = "The Artifact Registry repository name"
}

output "GCP_SA_EMAIL" {
  value       = google_service_account.github_actions.email
  description = "The email of the Service Account created for CI/CD"
}

output "GCP_SA_KEY" {
  description = "Service account JSON key in plain text (encoded by Terraform). Sensitive: True"
  value       = base64decode(google_service_account_key.github_actions_key.private_key)
  sensitive   = true
}
