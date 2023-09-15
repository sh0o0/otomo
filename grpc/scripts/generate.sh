#!/bin/sh

echo "Start generate"

cd $(dirname $0)

PROTO_DIR="/usr/local/include"
PROTOS_DIR=../protos
PROTO_FILES=$PROTOS_DIR/*.proto
DOCS_DIR=../../docs
API_DIR=../../api
FRONTEND_DIR=../../frontend
# FIREBASE_DIR=../../firebase

EXCLUDED_VALIDATE_PROTOS_DIR="../excluded_validate_protos"
EXCLUDED_VALIDATE_PROTO_FILES="../excluded_validate_protos/*.proto"

setup() {
    cp -r $PROTOS_DIR $EXCLUDED_VALIDATE_PROTOS_DIR

    for dir in $(find "${EXCLUDED_VALIDATE_PROTOS_DIR}" -name '*.proto' -print0 | xargs -0 -n1 dirname | sort | uniq); do
        sed -i -E "s/ \[(validate.rules).*\];/;/g" $(find "${dir}" -name '*.proto')
        sed -i -E "/validate.proto/d" $(find "${dir}" -name '*.proto')
    done
}

cleanup() {
    rm -r $EXCLUDED_VALIDATE_PROTOS_DIR
}

setup

### Go & validator & docs
protoc \
    -I $PROTOS_DIR \
    -I ${GOPATH}/src \
    -I ${GOPATH}/src/github.com/envoyproxy/protoc-gen-validate \
    -I ${PROTO_DIR} \
    --go-grpc_opt=require_unimplemented_servers=false \
    --go_out=$API_DIR/internal/app/grpcgen/ \
    --go-grpc_out=$API_DIR/internal/app/grpcgen/ \
    --validate_out="lang=go:$API_DIR/internal/app/grpcgen/" \
    --doc_out=html,grpc.html:$DOCS_DIR/grpc/ \
    $PROTO_FILES

### Dart
protoc \
    -I $PROTOS_DIR \
    -I ${GOPATH}/src \
    -I ${GOPATH}/src/github.com/envoyproxy/protoc-gen-validate \
    -I ${PROTO_DIR} \
    --dart_out=grpc:$FRONTEND_DIR/lib/grpc/generated/ \
    ${PROTO_DIR}/google/protobuf/timestamp.proto \
    ${PROTO_DIR}/google/protobuf/empty.proto \
    ${PROTO_DIR}/google/protobuf/wrappers.proto \
    $PROTO_FILES

### TS
# Reference: https://qiita.com/ohs30359-nobuhara/items/f11857d5d3d9dbc6637b
PLUGIN_TS=$FIREBASE_DIR/functions/node_modules/.bin/protoc-gen-ts
PLUGIN_GRPC=$FIREBASE_DIR/functions/node_modules/.bin/grpc_tools_node_protoc_plugin
DIST_DIR=$FIREBASE_DIR/functions/src/protos

protoc \
    -I $EXCLUDED_VALIDATE_PROTOS_DIR \
    -I ${GOPATH}/src \
    -I ${PROTO_DIR} \
    --js_out=import_style=commonjs,binary:"${DIST_DIR}"/ \
    --ts_out=import_style=commonjs,binary:"${DIST_DIR}"/ \
    --grpc_out="${DIST_DIR}"/ \
    --plugin=protoc-gen-grpc="${PLUGIN_GRPC}" \
    --plugin=protoc-gen-ts="${PLUGIN_TS}" \
    $EXCLUDED_VALIDATE_PROTO_FILES

echo "Finish generate"

cleanup
