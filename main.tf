terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}
provider "google" {
  project = "mg0050"
  region = "europe-west3"
  zone = "europe-west3-c"
  credentials = "../key/mg0050-7434bf30523b.json"
}
resource "google_compute_network" "mg0050" {
  project = "mg0050"
  name = "mg0050"
  auto_create_subnetworks = false  
}
resource "google_compute_subnetwork" "pub1-mg0050" {
  name = "pub1-mg0050"
  network = google_compute_network.mg0050.id
  ip_cidr_range = "10.0.0.0/24"
  region = "europe-west3"
}
resource "google_compute_subnetwork" "pri1-mg0050" {
  name = "pri1-mg0050"
  network = google_compute_network.mg0050.id
  ip_cidr_range = "10.0.1.0/24"
  region = "europe-west3"
}