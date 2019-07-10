variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "ENDPOINT_ADDRESS" {
}

variable "S3_BUCKET" {

}

variable "S3_LAMBDA_KEY" {
}

variable "LAMBDA_BINARIES" {
  default = "serverless/dmoshi.com.contactme.lambda/target/contactme-lambda-1.0.0-SNAPSHOT.jar"
}

variable "LAMBDA_FUNCTION_HANDLER" {
  default = "com.dmoshi.lambda.contactme.ContactMeFunctionHandler"
}

variable "LAMBDA_RUNTIME" {
  default = "java8"
}

variable "API_PATH" {
  default = "contactme"
}

variable "HTTP_METHOD" {
  default = "POST"
}


variable "GATEWAY_INTEGRATION_TYPE" {
  default = "LAMBDA_PROXY"
}

variable "API_STAGE_NAME" {
  default = "prod"
}

