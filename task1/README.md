# Deploying a "Hello World" Application to Cloud Run using Terraform
# Task-1

This guide provides steps to create a new GCP project, enable required APIs, create a Docker image for a simple "Hello World" application, push it to Google Artifact Registry, and deploy it to Cloud Run using Terraform.

## Prerequisites

- Google Cloud SDK (gcloud)
- Docker
- Terraform

## Steps

1. **Create a new GCP project**:
   ```bash
   gcloud projects create [PROJECT_ID]
   gcloud config set project [PROJECT_ID]

2. **Run the following commands to enable API in GCP console**:
   ```bash
   gcloud services enable run.googleapis.com
   gcloud services enable cloudbuild.googleapis.com
   gcloud services enable artifactregistry.googleapis.com

3. **Once above setting are finished, we can run terraform**
   ```bash
   terraform init
   terraform plan
   terraform apply

Task1 output link: https://hello-world-service-zrkcpr76wa-el.a.run.app