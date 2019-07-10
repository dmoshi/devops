resource "aws_lambda_function" "contactme_lambda" {
  function_name = "DMoshiContactMe"
  filename = "${var.LAMBDA_BINARIES}"
  s3_bucket = "${var.S3_BUCKET}"
  s3_key    = "${var.S3_LAMBDA_KEY}" 
  # s3_key    = "v${var.APP_VERSION}/${var.S3_LAMBDA_KEY}"
  handler = "${var.LAMBDA_FUNCTION_HANDLER}"
  runtime = "${var.LAMBDA_RUNTIME}"
  role = "${aws_iam_role.lambda_exec.arn}"
  source_code_hash = "${base64sha256(file(var.LAMBDA_BINARIES))}"
}

resource "aws_iam_role" "lambda_exec" {
  name = "serverless_contactme_lambda"

  assume_role_policy = <<EOF
{
   "Version":"2012-10-17",
		   "Statement":[{
		      "Effect":"Allow",
		      "Action":"sns:Publish",
		      "Resource":"${aws_sns_topic.dmoshi_contactme_sns.arn}"
		      }
		   ]
}
EOF
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.contactme_lambda.arn}"
  principal     = "apigateway.amazonaws.com"
  source_arn = "${aws_api_gateway_deployment.contactme_deploy.execution_arn}"
}
 
