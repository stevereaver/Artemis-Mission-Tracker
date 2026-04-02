# Artemis II Mission Tracker

A high-fidelity, real-time mission dashboard for the **Artemis II** crewed lunar flyby mission. This dashboard provides a comprehensive view of the mission's trajectory, crew routines, and spacecraft operations, synchronized with the official mission clock.

## 🚀 Features

- **Real-Time Simulation**: Synchronized with the actual mission clock (anchored to April 1, 2026, 22:35 UTC).
- **Dual-Column Timeline**: 
  - **Crew Lane**: Tracks wakes, meals, exercise, medical checks (PMC/DPC), and sleep cycles.
  - **Attitude Lane**: Tracks burns, separations, telescope checkouts, and passive thermal control (PTC) rolls.
- **Flight Path Tracking**: A visual "figure-8" trajectory representation with an animated Orion spacecraft icon.
- **Dynamic Timezone Selector**: View mission milestones in **Central (CT)**, **Eastern (ET)**, **Pacific (PT)**, **AEDT (Sydney)**, or **GMT (Zulu)**.
- **Speed Simulation**: Fast-forward through the 10-day mission at 500x or 5000x to see future events.
- **Premium UI**: Dark mode, glassmorphic effects, and smooth animations using vanilla CSS.

## 🛠️ Technology Stack

- **HTML5**: Semantic structure.
- **Vanilla CSS**: Custom styling with glassmorphism and keyframe animations.
- **JavaScript (ES6)**: Real-time simulation engine and dynamic DOM rendering.
- **YouTube API**: Embedded live coverage support.

## 📋 Data Source

All mission events—including the granular "Day in the Life" routines—are derived from the official Artemis II mission protocol and flight day schedules.

## 🚦 How to Use

### Direct Browser
1. Clone this repository to your local machine.
2. Open `index.html` in any modern web browser.
3. Use the **Timezone** dropdown to sync the timeline to your local clock.
4. Use the **Speed** buttons to fast-forward or the **Reset** button to return to real-time.

### Docker (Recommended)
You can run the mission tracker in a portable Nginx container using either Docker or Docker Compose.

**Using Docker Compose**:
```bash
docker-compose up -d
```
Visit the dashboard at `http://localhost:8080`.

**Using Docker CLI**:
1. Build the image:
   ```bash
   docker build -t artemis-tracker .
   ```
2. Run the container:
   ```bash
   docker run -d -p 8080:80 artemis-tracker
   ```
Visit the dashboard at `http://localhost:8080`.

## 🚢 CI/CD Deployment (Google Cloud Run)

This project includes a GitHub Actions workflow that automatically builds and deploys your dashboard to **Google Cloud Run** whenever you push to the `main` branch.

### 🔑 Required GitHub Secrets
To enable automated deployment, add the following secrets to your GitHub repository (**Settings > Secrets and variables > Actions**):

| Secret Name | Description |
| :--- | :--- |
| `GCP_PROJECT_ID` | Your Google Cloud Project ID (e.g., `my-artemis-project`). |
| `GCP_SA_KEY` | The full content of your Service Account JSON key file. |
| `GCP_SERVICE_NAME` | The name for the Cloud Run service (e.g., `artemis-dashboard`). |
| `GCP_REGION` | The deployment region (e.g., `us-central1`). |
| `GCP_REPOSITORY` | The name of your Docker Artifact Registry repository (e.g., `artemis-images`). |

### 🛠️ Google Cloud Setup Checklist
1. **Enable APIs**: Navigate to the GCP Console and enable the **Cloud Run**, **Artifact Registry**, and **Cloud Build** APIs.
2. **Create Registry**: Create a new **Docker** repository in **Artifact Registry** matching your `GCP_REPOSITORY` name.
3. **Service Account**: 
   - Create a Service Account and assign the **Cloud Run Admin**, **Artifact Registry Writer**, and **Service Account User** roles.
   - Generate a **JSON Key** for this account and paste its content into the `GCP_SA_KEY` GitHub secret.

## 🌍 Terraform Infrastructure Setup

Alternatively, you can use the provided Terraform configuration in the `terraform/` directory to automate the GCP setup.

### 1. Initialize Terraform
```bash
cd terraform
terraform init
```

### 2. Configure Variables
Create a `terraform.tfvars` file and fill in your details:
```hcl
GCP_PROJECT_ID   = "your-gcp-project-id"
GCP_REGION       = "us-central1"
GCP_SERVICE_NAME = "artemis-tracker"
GCP_REPOSITORY   = "artemis-images"
```

### 3. Apply Infrastructure
```bash
terraform plan
terraform apply
```

### 4. Get GitHub Secrets
After success, Terraform will output the information you need. To see the sensitive Service Account key:
```bash
terraform output -raw GCP_SA_KEY
```
Copy this output and use it for the `GCP_SA_KEY` secret in GitHub.



---
*Follow the historic return of humanity to the Moon.*
