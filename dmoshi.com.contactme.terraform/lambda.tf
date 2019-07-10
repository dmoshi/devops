resource "aws_lambda_function" "contactme_lambda" {
  function_name = "DMoshiContactMeTF"
  filename = "${var.LAMBDA_BINARIES}"
  handler = "${var.LAMBDA_FUNCTION_HANDLER}"
  runtime = "${var.LAMBDA_RUNTIME}"
  role = "${aws_iam_role.lambda_exec.arn}"
}

resource "aws_iam_role" "lambda_exec" {
  name = "serverless_contactme_lambda"

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

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowExecutionFromApiGateway"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.contactme_lambda.function_name}"
  principal     = "apigateway.amazonaws.com"
  source_arn = "${replace(aws_api_gateway_deployment.contactme_deploy.execution_arn, var.API_STAGE_NAME, "")}*/*"
  
}
 
