resource "aws_elasticsearch_domain" "monitoring-framework" {
  domain_name           = "tg-${var.environment}-es"
  elasticsearch_version = "2.3"

  cluster_config {
    instance_type            = "t2.small.elasticsearch"
    instance_count           = 1
    dedicated_master_enabled = false
    dedicated_master_type    = "m4.large.elasticsearch"
    dedicated_master_count   = 1
  }

  ebs_options {
    ebs_enabled = true
    volume_size = 30
  }
  tags = {
    git_commit           = "4d579c0d2e5fd64431dc9adbef512d9740bfa650"
    git_file             = "terraform/aws/es.tf"
    git_last_modified_at = "2020-06-09 12:52:30"
    git_last_modified_by = "guetaaviv@gmail.com"
    git_modifiers        = "guetaaviv"
    git_org              = "darnon81"
    git_repo             = "terragoat"
    yor_trace            = "118fd7f8-b3d7-43d9-b418-7dd16a646a4c"
    yor_name             = "monitoring-framework"
  }
}

data aws_iam_policy_document "policy" {
  statement {
    actions = ["es:*"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = ["*"]
  }
}

resource "aws_elasticsearch_domain_policy" "monitoring-framework-policy" {
  domain_name     = aws_elasticsearch_domain.monitoring-framework.domain_name
  access_policies = data.aws_iam_policy_document.policy.json
}
