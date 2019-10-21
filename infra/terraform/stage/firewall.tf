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
