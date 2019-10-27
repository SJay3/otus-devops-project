resource "google_compute_firewall" "prometheus_http" {
  name = "allow-prometeus-${var.environment}-web"
  network = "devops"

  allow {
    protocol = "tcp"
    ports = ["9090"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["docker-${var.environment}"]
}

resource "google_compute_firewall" "grafana_http" {
  name = "allow-grafana-${var.environment}-web"
  network = "devops"

  allow {
    protocol = "tcp"
    ports = ["3000"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["docker-${var.environment}"]
}
