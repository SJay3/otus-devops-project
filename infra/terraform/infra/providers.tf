# INFRA ENV PROVIDER
terraform {
  # версия terraform
  required_version = ">= 0.12.0"
}

provider "google" {
  # Версия провайдера
  version = ">=2.16.0"

  # id проекта
  project = var.project

  region = var.region

  credentials = var.gcp_key_path != null ? "${file(var.gcp_key_path)}" : null

}
