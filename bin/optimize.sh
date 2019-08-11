#!/bin/bash

echo "** Building For Repo Authoritative"
set -x
hhvm --hphp --target hhbc \
  -l3 \
  --module src \
  --module boot \
  --module config \
  --module vendor \
  --ffile public/index.hack \
  --ffile .env \
  --output-dir /var/out 
set +x
