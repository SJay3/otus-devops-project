#### PROD ENV ####

module "docker" {
  source = "../modules/docker"
  environment = var.environment

  ssh_user = var.ssh_user
  public_key_path = var.public_key_path
  zone            = var.zone
  instance_count = var.instance_count
  machine_type = var.machine_type
  docker_disk_size = var.docker_disk_size
  enable_web_traffic = var.enable_web_traffic
  subnet_cidr_range = var.subnet_cidr_range

}
