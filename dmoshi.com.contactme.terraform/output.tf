output "base_url" {
  value = "${aws_api_gateway_deployment.contactme_deploy.invoke_url}"
}

output "curl" {
  value = "curl -H 'Content-Type: application/json' -X POST -d '{\"sendersEmail\": \"daniel.moshi@dmoshi.com\",\"message\": \"Contact App Deployed and working successfully\"}' https://${aws_api_gateway_rest_api.contactme_api.id}.execute-api.${var.AWS_REGION}.amazonaws.com/${aws_api_gateway_deployment.contactme_deploy.stage_name}${aws_api_gateway_resource.proxy.path}"
}