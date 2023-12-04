#!/bin/bash

cp js/config.org js/config.temp
sed  -i "s/xxxx/$(sam list stack-outputs --stack-name ${ENV_STACK_NAME} |grep CognitoPoolID | awk '{print $2}')/" js/config.temp
sed  -i "s/yyyy/$(sam list stack-outputs --stack-name ${ENV_STACK_NAME} |grep CognitoPoolAppID | awk '{print $2}')/" js/config.temp
sed  -i "s/zzzz/$(sam list stack-outputs --stack-name ${ENV_STACK_NAME} |grep WebsiteUrl | grep -o -P '(?<=//).*(?=.pete)')/g" js/config.temp
cp js/config.temp js/config.js
aws s3 cp ./ s3://${ENV_STACK_NAME} --recursive
