provider "google" {
  project     = "cwp-qa-test-1"
  region      = "us-central1"
}
resource "google_compute_instance" "confidential" {
  name         = "vp-computeinstance-1"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  confidential_instance_config {
     enable_confidential_compute = false  
    
  }
}
