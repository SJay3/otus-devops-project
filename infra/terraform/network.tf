terraform {
  # версия terraform
  required_version = ">= 0.12.0"
}

provider "google" {
  # Версия провайдера
  version = ">=2.16.0"
  project = var.project
  region = var.region
   
  credentials = var.gcp_key_path != null ? "${file(var.gcp_key_path)}" : null
}

resource "google_compute_network" "network" {
	name = "devops"
	description = "Network for devops project"
	auto_create_subnetworks = false
}
