locals {
  region = "australia-southeast1"
  zone = "australia-southeast1-a"
  project = "dataflow-pubsub-django"

}

provider "google" {
    region = local.region
    project = local.project
    version = "~> 3.15.0"
}

provider "google-beta" {
    region = local.region
    project = local.project
    version = "~> 3.15.0"
}

provider "local" {
  version = "~> 1.4.0"
}

terraform {
  required_version = "~> 0.12.24"
  backend "gcs" {
    prefix = "terraform/state"
  }
}