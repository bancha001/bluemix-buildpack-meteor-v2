#!/usr/bin/env bash

echo "MongoDB Service Binding" | indent
echo "export MONGO_URL=\${MONGO_URL:-`ruby -e "require 'json'; puts JSON.parse(ENV['VCAP_SERVICES']).find { |key,value| value[0]['label'].eql? 'mongolab' }[1][0]['credentials']['uri']"`}" > $BUILD_DIR"/.profile.d/mongo.sh"
