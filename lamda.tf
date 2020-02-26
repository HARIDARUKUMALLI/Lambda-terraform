provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}
resource "aws_lambda_function" "test_lambda" {
  function_name = "ServerlessExample"
  s3_bucket     = "test-manasa-terraform"
  s3_key        = "40006935-102019.zip"
  handler       = "ServerlessExample.lamda_handler"
  runtime       = "python3.8"
  role          = aws_iam_role.lambda_exec.arn

}
resource "aws_iam_role" "lambda_exec" {
  name               = "serverless_example_lambda"
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
}
