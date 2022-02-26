#!/bin/bash

env GOARCH=amd64 GOOS=linux go build main.go

zip main.zip main

aws lambda create-function \
    --function-name cli-go-function \
	  --zip-file fileb://main.zip --handler main --runtime go1.x \
    --role arn:aws:iam::790263121367:role/lambda-ex
