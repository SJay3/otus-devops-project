terraform {
  # версия terraform
  required_version = ">= 0.12.0"
}

provider "google" {
  # Версия провайдера
  version = ">=2.16.0"
  project = var.project
  region  = var.region

  credentials = var.gcp_key_path != null ? "${file(var.gcp_key_path)}" : null
}

resource "google_compute_network" "network" {
  name                    = "devops"
  description             = "Network for devops project"
  auto_create_subnetworks = false
}

resource "google_compute_firewall" "default-ssh" {
  name    = "${google_compute_network.network.name}-allow-ssh"
  network = google_compute_network.network.self_link

  priority = 65534

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "default-icmp" {
  name    = "${google_compute_network.network.name}-allow-icmp"
  network = google_compute_network.network.self_link

  priority = 65534

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "default-internal" {
  name    = "${google_compute_network.network.name}-allow-internal"
  network = google_compute_network.network.self_link

  priority = 65534

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  source_ranges = ["10.200.0.0/16"]
}
