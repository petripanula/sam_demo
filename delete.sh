#!/bin/bash
set -e
aws s3 rm s3://pete.weasel.fi --recursive
sam delete --stack-name sam-app-dev --no-prompts
