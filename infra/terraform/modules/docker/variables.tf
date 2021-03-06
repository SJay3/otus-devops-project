### Docker Module Variables
variable "environment" {
  type = "string"
  description = "Current environment"
}

variable "ssh_user" {
  type = "string"
  description = "ssh username"
}

variable "public_key_path" {
  type        = "string"
  description = "Path to the public key used to connect to instance for user defined in ssh_user"
}

variable "zone" {
  type        = "string"
  description = "Zone"
  default     = "europe-west1-b"
}

variable "machine_type" {
  type = "string"
  description = "GCP machine type. g1-small by default"
  default = "g1-small"
}

variable "docker_disk_image" {
  type        = "string"
  description = "Disk image for reddit app"
  default     = "docker-base"
}

variable "docker_disk_size" {
  type = "string"
  description = "Boot disk size"
  default = "10"
}

variable "instance_count" {
  type        = number
  description = "Count instances"
  default     = 1
}

### Firewall settings
variable "enable_web_traffic" {
  type = bool
  description = "Create http/https firewall rules and map to instance or not"
  default = false
}

### Network settings
variable "subnet_cidr_range" {
  type = "string"
  description = "Ip cidr range for subnetwork. Required"
}
