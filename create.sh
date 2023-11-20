#!/bin/bash
set -e
cd WebApllication/
aws s3 cp ./index.zip s3://weasel-sam-test
cd ..
sam build
sam validate
sam deploy --capabilities CAPABILITY_IAM --stack-name sam-app-dev
cd WebApllication/
./modify_config_and_cp_to_s3.sh

