resource "aws_s3_bucket" "data" {
  # bucket is public
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "${local.resource_prefix.value}-data"
  acl           = "public-read"
  force_destroy = true
  tags = {
    Name                 = "${local.resource_prefix.value}-data"
    Environment          = local.resource_prefix.value
    git_commit           = "8ee70df3dcba70ab1bafafad5f7efe2a41cd53a3"
    git_file             = "terraform/aws/s3.tf"
    git_last_modified_at = "2020-04-09 21:14:59"
    git_last_modified_by = "jonjozwiak@users.noreply.github.com"
    git_modifiers        = "jonjozwiak/schosterbarak"
    git_org              = "darnon81"
    git_repo             = "terragoat"
    yor_trace            = "fc8c2d7a-1997-4fc2-95c1-277cba5c2a38"
    yor_name             = "data"
  }
  versioning {
    enabled = "${var.versioning_enabled}"
  }
}

resource "aws_s3_bucket_object" "data_object" {
  bucket = aws_s3_bucket.data.id
  key    = "customer-master.xlsx"
  source = "resources/customer-master.xlsx"
  tags = {
    Name                 = "${local.resource_prefix.value}-customer-master"
    Environment          = local.resource_prefix.value
    git_commit           = "d68d2897add9bc2203a5ed0632a5cdd8ff8cefb0"
    git_file             = "terraform/aws/s3.tf"
    git_last_modified_at = "2020-06-16 14:46:24"
    git_last_modified_by = "nimrodkor@gmail.com"
    git_modifiers        = "jonjozwiak/nimrodkor"
    git_org              = "darnon81"
    git_repo             = "terragoat"
    yor_trace            = "b77af90c-712d-4209-90ad-d46815ab3eb7"
    yor_name             = "data_object"
  }
}

resource "aws_s3_bucket" "financials" {
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "${local.resource_prefix.value}-financials"
  acl           = "private"
  force_destroy = true
  tags = {
    Name                 = "${local.resource_prefix.value}-financials"
    Environment          = local.resource_prefix.value
    git_commit           = "8ee70df3dcba70ab1bafafad5f7efe2a41cd53a3"
    git_file             = "terraform/aws/s3.tf"
    git_last_modified_at = "2020-04-09 21:14:59"
    git_last_modified_by = "jonjozwiak@users.noreply.github.com"
    git_modifiers        = "jonjozwiak/schosterbarak"
    git_org              = "darnon81"
    git_repo             = "terragoat"
    yor_trace            = "cecbef60-a2ea-4710-9d45-b865340e6095"
    yor_name             = "financials"
  }

}

resource "aws_s3_bucket" "operations" {
  # bucket is not encrypted
  # bucket does not have access logs
  bucket = "${local.resource_prefix.value}-operations"
  acl    = "private"
  versioning {
    enabled = true
  }
  force_destroy = true
  tags = {
    Name                 = "${local.resource_prefix.value}-operations"
    Environment          = local.resource_prefix.value
    git_commit           = "8ee70df3dcba70ab1bafafad5f7efe2a41cd53a3"
    git_file             = "terraform/aws/s3.tf"
    git_last_modified_at = "2020-04-09 21:14:59"
    git_last_modified_by = "jonjozwiak@users.noreply.github.com"
    git_modifiers        = "jonjozwiak/schosterbarak"
    git_org              = "darnon81"
    git_repo             = "terragoat"
    yor_trace            = "e62dfbc0-cc44-408b-a26a-13938d22e2f0"
    yor_name             = "operations"
  }

}

resource "aws_s3_bucket" "data_science" {
  # bucket is not encrypted
  bucket = "${local.resource_prefix.value}-data-science"
  acl    = "private"
  versioning {
    enabled = true
  }
  logging {
    target_bucket = "${aws_s3_bucket.logs.id}"
    target_prefix = "log/"
  }
  force_destroy = true
  tags = {
    git_commit           = "e813ae880f7b234b138041860b509629b0f69218"
    git_file             = "terraform/aws/s3.tf"
    git_last_modified_at = "2020-03-28 12:35:15"
    git_last_modified_by = "schosterbarak@gmail.com"
    git_modifiers        = "schosterbarak"
    git_org              = "darnon81"
    git_repo             = "terragoat"
    yor_trace            = "25565a41-2c9e-45f2-a9e9-6c15b7afcfb6"
    yor_name             = "data_science"
  }
}

resource "aws_s3_bucket" "logs" {
  bucket = "${local.resource_prefix.value}-logs"
  acl    = "log-delivery-write"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = "${aws_kms_key.logs_key.arn}"
      }
    }
  }
  force_destroy = true
  tags = {
    Name                 = "${local.resource_prefix.value}-logs"
    Environment          = local.resource_prefix.value
    git_commit           = "8ee70df3dcba70ab1bafafad5f7efe2a41cd53a3"
    git_file             = "terraform/aws/s3.tf"
    git_last_modified_at = "2020-04-09 21:14:59"
    git_last_modified_by = "jonjozwiak@users.noreply.github.com"
    git_modifiers        = "jonjozwiak/schosterbarak"
    git_org              = "darnon81"
    git_repo             = "terragoat"
    yor_trace            = "ce72f84f-4cb6-4f67-b540-54d7e998df19"
    yor_name             = "logs"
  }
}
