resource "aws_iam_role" "iam_for_lambda" {
  name = "${local.resource_prefix.value}-analysis-lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  tags = {
    git_commit           = "c4368de43d43ba8cc06c05481429314282942698"
    git_file             = "terraform/aws/lambda.tf"
    git_last_modified_at = "2020-03-28 20:41:46"
    git_last_modified_by = "schosterbarak@gmail.com"
    git_modifiers        = "schosterbarak"
    git_org              = "darnon81"
    git_repo             = "terragoat"
    yor_trace            = "25847052-213e-4654-9000-c57924a6ad04"
    yor_name             = "iam_for_lambda"
  }
}

resource "aws_lambda_function" "analysis_lambda" {
  # lambda have plain text secrets in environment variables
  filename      = "resources/lambda_function_payload.zip"
  function_name = "${local.resource_prefix.value}-analysis"
  role          = "${aws_iam_role.iam_for_lambda.arn}"
  handler       = "exports.test"

  source_code_hash = "${filebase64sha256("resources/lambda_function_payload.zip")}"

  runtime = "nodejs12.x"

  environment {
    variables = {
      access_key = "AKIAIOSFODNN7EXAMPLE"
      secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
    }
  }
  tags = {
    git_commit           = "b84e029fe036dce1a31ae3de28a56a5ff0013f5c"
    git_file             = "terraform/aws/lambda.tf"
    git_last_modified_at = "2020-03-28 22:33:46"
    git_last_modified_by = "schosterbarak@gmail.com"
    git_modifiers        = "schosterbarak"
    git_org              = "darnon81"
    git_repo             = "terragoat"
    yor_trace            = "611e7f1a-047c-4b66-9028-39dd298833b4"
    yor_name             = "analysis_lambda"
  }
}