#!/usr/bin/env bash

echo "MongoDB Service Binding" | indent
mkdir -p "$BUILD_DIR"/.profile.d
cat | tee "$BUILD_DIR"/.profile.d/mongo.sh <<EOF
  #!/bin/sh
  export ROOT_URL=\${ROOT_URL:-`ruby -e 'require "json"; puts "http://#{JSON.parse(ENV["VCAP_APPLICATION"])["application_uris"][0]}"'`}
  export MONGO_URL=\${MONGO_URL:-`ruby -e "require 'json'; puts JSON.parse(ENV['VCAP_SERVICES']).find { |key,value| value[0]['label'].eql? 'user-provided' }[1][0]['credentials']['uri']"`}
EOF
