data google_compute_zones "zones" {}

resource google_compute_instance "server" {
  machine_type = "n1-standard-1"
  name         = "terragoat-${var.environment}-machine"
  zone         = data.google_compute_zones.zones.names[0]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
    auto_delete = true
  }
  network_interface {
    subnetwork = google_compute_subnetwork.public-subnetwork.name
    access_config {}
  }
  can_ip_forward = true

  metadata = {
    block-project-ssh-keys = false
    enable-oslogin         = false
    serial-port-enable     = true
  }
  labels = {
    git_commit           = "43e65f45635a56da3dceba9486323685dbbf9b95"
    git_file             = "terraform__gcp__instances_tf"
    git_last_modified_at = "2020-07-28-16-49-01"
    git_last_modified_by = "mike"
    git_modifiers        = "mike"
    git_org              = "darnon81"
    git_repo             = "terragoat"
    yor_trace            = "f3b60229-9824-4961-bc87-3365958badb4"
    yor_name             = "server"
  }
}

resource google_compute_disk "unencrypted_disk" {
  name = "terragoat-${var.environment}-disk"
  labels = {
    git_commit           = "43e65f45635a56da3dceba9486323685dbbf9b95"
    git_file             = "terraform__gcp__instances_tf"
    git_last_modified_at = "2020-07-28-16-49-01"
    git_last_modified_by = "mike"
    git_modifiers        = "mike"
    git_org              = "darnon81"
    git_repo             = "terragoat"
    yor_trace            = "db914048-2ec8-4c0f-b081-1a71588b80eb"
    yor_name             = "unencrypted_disk"
  }
}