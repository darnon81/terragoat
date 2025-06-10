resource "aws_iam_user" "user" {
  name          = "${local.resource_prefix.value}-user"
  force_destroy = true

  tags = {
    Name                 = "${local.resource_prefix.value}-user"
    Environment          = local.resource_prefix.value
    git_commit           = "24831c83746f8072526760efbfc211385d194782"
    git_file             = "terraform/aws/iam.tf"
    git_last_modified_at = "2020-04-10 14:42:14"
    git_last_modified_by = "jonathan.jozwiak@googlemail.com"
    git_modifiers        = "jonathan.jozwiak"
    git_org              = "darnon81"
    git_repo             = "terragoat"
    yor_trace            = "f9d81ed3-9207-49f5-8761-f3bde6bdb125"
    yor_name             = "user"
  }

}

resource "aws_iam_access_key" "user" {
  user = aws_iam_user.user.name
}

resource "aws_iam_user_policy" "userpolicy" {
  name = "excess_policy"
  user = "${aws_iam_user.user.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:*",
        "s3:*",
        "lambda:*",
        "cloudwatch:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

output "username" {
  value = aws_iam_user.user.name
}

output "secret" {
  value = aws_iam_access_key.user.encrypted_secret
}

