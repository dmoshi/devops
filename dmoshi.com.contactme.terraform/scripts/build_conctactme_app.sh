#!/usr/bin/env bash

cd ..
rm plan.out
rm -rf serverless
git clone https://github.com/dmoshi/serverless.git
cd serverless/dmoshi.com.contactme.lambda
printf '\n\nBuilding the Java Lambda Function!\n\n'
mvn package -DskipTests 

if [ $? -ne 0 ]; then
  printf '\n\nJava application build failed! No new Lambda Function will be deployed!!!i\n'
  exit -1
fi

cd ../..
printf '\n\nStarting the Terraforming!\n\n'
terraform init
terraform plan -out=plan.out -var APP_VERSION="0.0.1"
terraform apply plan.out