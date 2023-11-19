#!/bin/bash

cp js/config.org js/config.temp
sed  -i "s/xxxx/$(sam list stack-outputs --stack-name weasel-sam-demo-stack |grep CognitoPoolID | awk '{print $2}')/" js/config.temp
sed  -i "s/yyyy/$(sam list stack-outputs --stack-name weasel-sam-demo-stack |grep CognitoPoolAppID | awk '{print $2}')/" js/config.temp
OUTPUT=$(sam list stack-outputs --stack-name weasel-sam-demo-stack --output json |grep api  | grep -o -P '(?<=: ").*(?=/")')
echo "${OUTPUT}"
sed -i "s|zzzz|$OUTPUT|" js/config.temp
cp js/config.temp js/config.js
aws s3 cp ./ s3://pete.weasel.fi --recursive
