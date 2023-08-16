#!/bin/sh

brew install protobuf
GO111MODULE=off go get -u github.com/envoyproxy/protoc-gen-validate

go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
go install github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc@latest

dart pub global activate protoc_plugin

# cd ./../../firebase/functions/ # for firebase
npm install -g ts-protoc-gen
