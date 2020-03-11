#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e6919bb814bbd0019fa5abe/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e6919bb814bbd0019fa5abe
curl -s -X POST https://api.stackbit.com/project/5e6919bb814bbd0019fa5abe/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e6919bb814bbd0019fa5abe/webhook/build/publish > /dev/null
