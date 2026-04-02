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

resource "google_project_iam_member" "artifact_registry_admin" {
  project = var.GCP_PROJECT_ID
  role    = "roles/artifactregistry.admin"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

resource "google_project_iam_member" "service_account_user" {
  project = var.GCP_PROJECT_ID
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

resource "google_project_iam_member" "storage_admin" {
  project = var.GCP_PROJECT_ID
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

resource "google_project_iam_member" "service_usage_admin" {
  project = var.GCP_PROJECT_ID
  role    = "roles/serviceusage.serviceUsageAdmin"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

resource "google_project_iam_member" "project_iam_admin" {
  project = var.GCP_PROJECT_ID
  role    = "roles/resourcemanager.projectIamAdmin"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

resource "google_project_iam_member" "sa_key_admin" {
  project = var.GCP_PROJECT_ID
  role    = "roles/iam.serviceAccountKeyAdmin"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

# Generate a Service Account Key for GitHub Secrets
resource "google_service_account_key" "github_actions_key" {
  service_account_id = google_service_account.github_actions.name
}
