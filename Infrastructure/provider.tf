provider "google" {
  project     = "isolution-419609"
  region      = "us-central1"
}


resource "google_storage_bucket" "terraform-bucket-for-state" {
  name                        = "bucket-for-mystatefile"
  location                    = "US"
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
  labels = {
    "environment" = "jorgebernhnardt"
  }
}
terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}