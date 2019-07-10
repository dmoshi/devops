#!/usr/bin/env bash

cd ..
terraform destroy -force  -var APP_VERSION="0.0.1"
rm plan.out
rm -rf serverless