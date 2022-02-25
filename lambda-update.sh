#!bin/bash

env GOARCH=amd64 GOOS=linux go build main.go

zip main.zip main

aws lambda update-function-code \
    --function-name cli-go-function \
	  --zip-file fileb://main.zip
