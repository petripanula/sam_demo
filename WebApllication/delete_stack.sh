#!/bin/bash
set -e
aws s3 rm s3://${ENV_STACK_NAME} --recursive
sam delete --stack-name ${ENV_STACK_NAME} --no-prompts
