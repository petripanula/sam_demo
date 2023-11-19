#!/bin/bash
set -e
aws s3 rm s3://pete.weasel.fi --recursive
sam delete --stack-name weasel-sam-demo-stack --no-prompts
