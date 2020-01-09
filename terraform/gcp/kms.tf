resource "google_kms_key_ring" "msteps-gke-keyring" {
  name     = "msteps-gke-keyring"
  location = var.region
}

resource "google_kms_crypto_key" "msteps-gke-key" {
  name            = "msteps-gke-crypto"
  key_ring        = google_kms_key_ring.msteps-gke-keyring.self_link
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
}