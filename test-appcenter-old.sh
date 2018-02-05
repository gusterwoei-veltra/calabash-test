#!/usr/bin/env bash

# Run calabash test on App Center
# result=$(appcenter test run calabash \
# --app "seongwoei.chua/calabash-test" \
# --devices "seongwoei.chua/nexus" \
# --app-path app/build/outputs/apk/app-debug.apk  \
# --test-series "master" \
# --locale "en_US" \
# --project-dir .)
appcenter test run calabash \
--app "seongwoei.chua/calabash-test" \
--devices "seongwoei.chua/nexus" \
--app-path app/build/outputs/apk/app-debug.apk  \
--test-series "master" \
--locale "en_US" \
--project-dir .

status=$?

# calabash-android run app/build/outputs/apk/app-debug.apk

# Check result status
# length=${#result}
# start=$(expr $length - 36)
# testid=${result:start:length}
# appcenter test status \
# --test-run-id ${testid} \
# --app seongwoei.chua/calabash-test

# Validate the cloud testing result
echo 'Test Result:'
if [ $status -eq 0 ]; then
   echo -e "\033[92m SUCCESS \033[0m"

   echo ""
   echo 'Deploying APK to DeployGate...'
   ./gradlew uploadDeployGateDebug
   echo -e "\033[92m App is successfully deployed to Deploy Gate \033[0m"
else
   echo -e "\033[31m FAILED \033[0m"
fi