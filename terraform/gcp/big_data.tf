resource google_sql_database_instance "master_instance" {
  name             = "terragoat-${var.environment}-master"
  database_version = "POSTGRES_11"
  region           = var.region

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "WWW"
        value = "0.0.0.0/0"
      }
    }
    backup_configuration {
      enabled = false
    }
  }
}

resource google_bigquery_dataset "dataset" {
  dataset_id = "terragoat_${var.environment}_dataset"
  access {
    special_group = "allAuthenticatedUsers"
    role          = "READER"
  }
  labels = {
    git_commit           = "43e65f45635a56da3dceba9486323685dbbf9b95"
    git_file             = "terraform__gcp__big_data_tf"
    git_last_modified_at = "2020-07-28-16-49-01"
    git_last_modified_by = "mike"
    git_modifiers        = "mike"
    git_org              = "darnon81"
    git_repo             = "terragoat"
    yor_trace            = "2e0da432-edec-4ccf-9017-a1dd63a1f8db"
    yor_name             = "dataset"
  }
}