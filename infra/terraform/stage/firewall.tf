resource "google_compute_firewall" "crawler_http" {
  name    = "allow-crawler-ui-${var.environment}-web"
  network = "devops"

  allow {
    protocol = "tcp"
    ports    = [var.crawler_ui_web_port]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["docker-${var.environment}"]
}

resource "google_compute_firewall" "crawler_engine_metrics" {
  name    = "allow-crawler-engine-${var.environment}-metrics"
  network = "devops"

  allow {
    protocol = "tcp"
    ports    = [var.crawler_engine_metrics_port]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["docker-${var.environment}"]
}
