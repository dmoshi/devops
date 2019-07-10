resource "aws_api_gateway_rest_api" "contactme_api" {
  name        = "DMoshiContactMeTF"
  description = "APi Gateway for contact me page"
}

resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = "${aws_api_gateway_rest_api.contactme_api.id}"
  parent_id   = "${aws_api_gateway_rest_api.contactme_api.root_resource_id}"
  path_part   = "${var.API_PATH}"
}

resource "aws_api_gateway_method" "proxy" {
  rest_api_id   = "${aws_api_gateway_rest_api.contactme_api.id}"
  resource_id   = "${aws_api_gateway_resource.proxy.id}"
  http_method   = "${var.HTTP_METHOD}"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda" {
  rest_api_id = "${aws_api_gateway_rest_api.contactme_api.id}"
  resource_id = "${aws_api_gateway_method.proxy.resource_id}"
  http_method = "${aws_api_gateway_method.proxy.http_method}"

  integration_http_method = "${aws_api_gateway_method.proxy.http_method}"
  type                    = "${var.GATEWAY_INTEGRATION_TYPE}"
  uri                     = "${aws_lambda_function.contactme_lambda.invoke_arn}"
  credentials             = "${aws_iam_role.lambda_apigateway_iam_role.arn}"
}

resource "aws_api_gateway_method_response" "OK_200" {
  rest_api_id = "${aws_api_gateway_rest_api.contactme_api.id}"
  resource_id = "${aws_api_gateway_resource.proxy.id}"
  http_method = "${aws_api_gateway_method.proxy.http_method}"
  
    response_models = {
    "application/json" = "Empty"
  }
  
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "contactme_integration_response" {
  depends_on = ["aws_api_gateway_integration.lambda"]
  rest_api_id = "${aws_api_gateway_rest_api.contactme_api.id}"
  resource_id = "${aws_api_gateway_resource.proxy.id}"
  http_method = "${aws_api_gateway_method.proxy.http_method}"
  status_code = "${aws_api_gateway_method_response.OK_200.status_code}"
}

resource "aws_api_gateway_deployment" "contactme_deploy" {
  depends_on = [
    "aws_api_gateway_integration.lambda" 
  ]

  rest_api_id = "${aws_api_gateway_rest_api.contactme_api.id}"
  stage_name  = "prod"
}