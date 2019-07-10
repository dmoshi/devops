resource "aws_lambda_function" "contactme_lambda" {
  function_name = "DMoshiContactMeTF"
  filename = "${var.LAMBDA_BINARIES}"
  handler = "${var.LAMBDA_FUNCTION_HANDLER}"
  runtime = "${var.LAMBDA_RUNTIME}"
  role = "${aws_iam_role.lambda_apigateway_iam_role.arn}"
  timeout = "${var.TIMEOUT}"
  memory_size = "${var.MEMORY_LIMIT}"
  
  environment {
    variables = {
      SNS_TOPIC_ARN = "${aws_sns_topic.dmoshi_contactme_sns.arn}"
      SUBJECT = "${var.SUBJECT}"
      REGION_NAME = "${var.AWS_REGION}"
    }
  }
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowExecutionFromApiGateway"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.contactme_lambda.function_name}"
  principal     = "apigateway.amazonaws.com"
  source_arn = "${replace(aws_api_gateway_deployment.contactme_deploy.execution_arn, var.API_STAGE_NAME, "")}*/*"
}
