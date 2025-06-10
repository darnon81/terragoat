resource "aws_kms_key" "logs_key" {
  # key does not have rotation enabled
  description = "${local.resource_prefix.value}-logs bucket key"

  deletion_window_in_days = 7
  tags = {
    git_commit           = "e813ae880f7b234b138041860b509629b0f69218"
    git_file             = "terraform/aws/kms.tf"
    git_last_modified_at = "2020-03-28 12:35:15"
    git_last_modified_by = "schosterbarak@gmail.com"
    git_modifiers        = "schosterbarak"
    git_org              = "darnon81"
    git_repo             = "terragoat"
    yor_trace            = "651492b6-4d42-4633-a9ce-3b9be25b9152"
    yor_name             = "logs_key"
  }
}

resource "aws_kms_alias" "logs_key_alias" {
  name          = "alias/${local.resource_prefix.value}-logs-bucket-key"
  target_key_id = "${aws_kms_key.logs_key.key_id}"
}


resource "aws_kms_key" "customer_key" {
  # key does not have rotation enabled
  description         = "${local.resource_prefix.value}-customer bucket key"
  enable_key_rotation = var.enable_key_rotation

  deletion_window_in_days = 7
  tags = {
    git_commit           = "8bbcf126f2cd5cedc896feb8617a524ad4daa768"
    git_file             = "terraform/aws/kms.tf"
    git_last_modified_at = "2020-12-08 22:29:14"
    git_last_modified_by = "schosterbarak@gmail.com"
    git_modifiers        = "mike/schosterbarak"
    git_org              = "darnon81"
    git_repo             = "terragoat"
    yor_trace            = "5fbd52d8-2726-4d86-afaf-836296566d69"
    yor_name             = "customer_key"
  }
}

resource "aws_kms_alias" "customer_key_alias" {
  name          = "alias/${local.resource_prefix.value}-customer-bucket-key"
  target_key_id = "${aws_kms_key.customer_key.key_id}"
}
