terraform {
  required_version = ">= 0.12"
}

provider "google" {
  project = var.project
  region  = var.region
  version = ">= 2.0"
}
