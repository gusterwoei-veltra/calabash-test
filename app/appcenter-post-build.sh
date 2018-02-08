#!/usr/bin/env bash
# appcenter's post-build script

cd ..
bundle install

echo '> Building Calabash test server apk'
calabash-android build $APPCENTER_OUTPUT_DIRECTORY/app-debug.apk

# Run calabash test on App Center
echo '> Running Calabash Test:'
appcenter test run calabash \
--app "seongwoei.chua/calabash-test" \
--devices "seongwoei.chua/nexus" \
--app-path $APPCENTER_OUTPUT_DIRECTORY/app-debug.apk \
--test-series "master" \
--locale "en_US" \
--token $API_TOKEN \
--project-dir .

# Check result status
status=$?

# Validate the cloud testing result
branch=$APPCENTER_BRANCH
if [[ $branch =~ ^"develop-v".*$ || $branch =~ ^"develop"$ ]]; then
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
elif [ $branch == "master" ]; then
   # deploy to google playstore
   # NOTE: Remember to update the 'whatsnew' file for the release note

   # uncomment to enable
   # ./gradlew publishApkRelease
fi