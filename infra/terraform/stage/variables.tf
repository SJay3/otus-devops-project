### STAGE ENV VARIABLES ###

variable "environment" {
  type        = "string"
  description = "Current environment"
}

# GCP Project
variable "project" {
  type        = "string"
  description = "Project ID"
}

variable "gcp_key_path" {
  type        = "string"
  description = "Path to GCP account key in JSON. If not specified used application default credentials"
  default     = null
}

variable "region" {
  type        = "string"
  description = "region"
  default     = "europe-west3"
}

variable "zone" {
  type        = "string"
  description = "Zone"
  default     = "europe-west3-b"
}

# VM vars
variable "ssh_user" {
  type        = "string"
  description = "ssh username"
}

variable "public_key_path" {
  type        = "string"
  description = "Path to the public key used to connect to instance for user defined in ssh_user"
}

variable "privat_key_path" {
  type        = "string"
  description = "Path to privat key used for provisioner connection"
}

variable "machine_type" {
  type        = "string"
  description = "GCP machine type. g1-small by default"
  default     = "n1-standard-1"
}

variable "docker_disk_size" {
  type        = "string"
  description = "Boot disk size"
  default     = "50"
}

variable "instance_count" {
  type        = number
  description = "Count instances"
  default     = 1
}

# Firewall vars
variable "enable_web_traffic" {
  type        = bool
  description = "Create http/https firewall rules and map to instance or not"
  default     = false
}

variable "crawler_ui_web_port" {
  type        = number
  description = "Crawler ui port number to create firewall rules"
  default     = 8000
}

variable "crawler_engine_metrics_port" {
  type        = number
  description = "Crawler engine port number with metrics to create firewall rules"
  default     = 8001
}

variable "metrics_ports" {
  type = list(number)
  description = "List of port nubmers"
  default = null
}

# Network vars
variable "subnet_cidr_range" {
  type        = "string"
  description = "Ip cidr range for subnetwork."
  default     = "10.200.101.0/24"
}
