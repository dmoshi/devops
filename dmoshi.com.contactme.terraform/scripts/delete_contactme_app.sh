#!/usr/bin/env bash

cd ..
terraform destroy -force
rm plan.out
rm -rf serverless