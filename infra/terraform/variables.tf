# GCP Project
variable "project" {
  type        = "string"
  description = "Project ID"
}

variable "gcp_key_path" {
  type = "string"
  description = "Path to GCP account key in JSON. If not specified used application default credentials"
  default = null
}

variable "region" {
  type        = "string"
  description = "region"
  default     = "europe-west1"
}
