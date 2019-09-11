resource "aws_lambda_function" "lambda" {
  function_name = "${var.lambda_function_name}"
  role          = "${aws_iam_role.role.arn}"
  handler       = "${var.lambda_function_handler}.handler"
  runtime       = "${var.runtime}"

  s3_bucket = "${var.s3_bucket}"
  s3_key    = "${var.s3_key}" #"v1.0.0/example.zip"

  publish = "${var.publish}"
  
  # environment {
  #   variables = "${var.lambda_env_variables}"
  # }

  dynamic "environment" { # Workarount for enabling empty map of environments 
    for_each = length(keys(var.lambda_env_variables)) > 0 ? [1]: []

    content {
      variables = "${var.lambda_env_variables}"
    }
  }
}




# locals {
  
# }