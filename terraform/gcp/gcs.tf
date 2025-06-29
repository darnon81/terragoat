resource "google_storage_bucket" "terragoat_website" {
  name          = "terragot-${var.environment}"
  force_destroy = true
  labels = {
    git_commit           = "43e65f45635a56da3dceba9486323685dbbf9b95"
    git_file             = "terraform__gcp__gcs_tf"
    git_last_modified_at = "2020-07-28-16-49-01"
    git_last_modified_by = "mike"
    git_modifiers        = "mike"
    git_org              = "darnon81"
    git_repo             = "terragoat"
    yor_trace            = "6b4a2e7a-c149-4082-91de-72ea665ce0ac"
    yor_name             = "terragoat_website"
  }
}

resource "google_storage_bucket_iam_binding" "allow_public_read" {
  bucket  = google_storage_bucket.terragoat_website.id
  members = ["allUsers"]
  role    = "roles/storage.objectViewer"
}

resource "google_storage_bucket" "internal_storage" {
  name          = "terragoat-internal"
  force_destroy = true
  labels = {
    git_commit           = "14c8868a3a13d0c92540595862543e3050df6248"
    git_file             = "terraform__gcp__gcs_tf"
    git_last_modified_at = "2020-07-30-15-31-05"
    git_last_modified_by = "mikeurbanski1"
    git_modifiers        = "mikeurbanski1"
    git_org              = "darnon81"
    git_repo             = "terragoat"
    yor_trace            = "8fb535d3-d75b-4557-8f1c-8260b7bc9230"
    yor_name             = "internal_storage"
  }
}
