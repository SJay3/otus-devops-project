### Docker Module
resource "google_compute_instance" "docker" {
  name = "docker-tf-${var.environment}-${count.index + 1}"
  machine_type = var.machine_type
  zone = var.zone
  tags = ["docker-host", var.environment, "docker-${var.environment}"]
  count = var.instance_count

  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = var.docker_disk_image
      size = var.docker_disk_size
    }
  }

  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    subnetwork = google_compute_subnetwork.docker_subnet.self_link

    # использовать ephemeral IP для доступа из Интернет
    access_config {
      nat_ip = google_compute_address.docker_ip[count.index].address
    }
  }

  metadata = {
    # Путь до публичного ключа
    ssh-keys = "${var.ssh_user}:${file(var.public_key_path)}"
  }

}

resource "google_compute_address" "docker_ip" {
  name = "docker-tf-${var.environment}-ip-${count.index + 1}"
  count = var.instance_count
  description = "external ip for docker host in env ${var.environment}"
}

resource "google_compute_subnetwork" "docker_subnet" {
  name = "docker-tf-${var.environment}-subnet"
  network = "devops"
  ip_cidr_range = var.subnet_cidr_range
}

resource "google_compute_firewall" "docker_http" {
  count = var.enable_web_traffic ? 1 : 0 # Если переменная false ресурс не будет создан
  name = "allow-docker-tf-${var.environment}-web"
  network = "devops"

  allow {
    protocol = "tcp"
    ports = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["docker-${var.environment}"]
}
