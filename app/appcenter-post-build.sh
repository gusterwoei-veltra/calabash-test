#!/usr/bin/env bash

echo '> Check Path'
# bundle install
appcenter test prepare calabash

# Run calabash test on App Center
echo '> Running Calabash Test:'
appcenter test run calabash \
--app "seongwoei.chua/calabash-test" \
--devices "seongwoei.chua/nexus" \
--app-path $APPCENTER_OUTPUT_DIRECTORY/app-debug.apk \
--test-series "master" \
--locale "en_US" \
--token $API_TOKEN \
--project-dir $APPCENTER_SOURCE_DIRECTORY

# Check result status
status=$?

# calabash-android run app/build/outputs/apk/app-debug.apk

# Validate the cloud testing result
echo '> Test Result:'
if [ $status -eq 0 ]; then
   echo -e "\033[92m SUCCESS \033[0m"

   echo ""
   echo 'Deploying APK to DeployGate...'
   ./gradlew uploadDeployGateDebug
   echo -e "\033[92m App is successfully deployed to Deploy Gate \033[0m"
else
   echo -e "\033[31m FAILED \033[0m"
fi