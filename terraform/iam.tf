# Create a dedicated Service Account for GitHub Actions
resource "google_service_account" "github_actions" {
  account_id   = "artemis-github-actions"
  display_name = "GitHub Actions Service Account"
}

# Assign roles to the Service Account
resource "google_project_iam_member" "run_admin" {
  project = var.GCP_PROJECT_ID
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

resource "google_project_iam_member" "artifact_registry_writer" {
  project = var.GCP_PROJECT_ID
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

resource "google_project_iam_member" "service_account_user" {
  project = var.GCP_PROJECT_ID
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

# Generate a Service Account Key for GitHub Secrets
resource "google_service_account_key" "github_actions_key" {
  service_account_id = google_service_account.github_actions.name
}
