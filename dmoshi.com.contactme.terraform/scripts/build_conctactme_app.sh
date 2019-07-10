#!/usr/bin/env bash

cd ..

git clone https://github.com/dmoshi/serverless.git
cd serverless/dmoshi.com.contactme.lambda
printf '\n\nBuilding the Java Lambda Function!\n\n'
mvn package shade:shade -DskipTests 
touch ../serverless/dmoshi.com.contactme.lambda/target/contactme-lambda-1.0.0-SNAPSHOT.jar
if [ $? -ne 0 ]; then
  printf '\n\nJava application build failed! No new Lambda Function will be deployed!!!i\n'
  exit -1
fi

cd ../..
printf '\n\nStarting the Terraforming!\n\n'
terraform plan -out=plan.out
