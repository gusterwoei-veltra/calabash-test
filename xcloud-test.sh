#!/usr/bin/env bash

appcenter test run calabash --app "seongwoei.chua/calabash-test" --devices "seongwoei.chua/nexus" --app-path app/build/outputs/apk/app-debug.apk  --test-series "master" --locale "en_US" --project-dir .

