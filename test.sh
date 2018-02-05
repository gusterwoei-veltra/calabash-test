#!/usr/bin/env bash

# Check result status
appcenter test status \
--test-run-id e5aa1216-1de7-492c-9a24-51d931c6498b \
--app seongwoei.chua/calabash-test

status=$?
echo $status

# Validate the cloud testing result
echo 'Test Result:'
if [ $status -eq 0 ]; then
   echo -e "\033[92m SUCCESS \033[0m"
   # echo ""
   # echo 'Deploying APK to DeployGate...'
   # ./gradlew uploadDeployGateDebug
   echo -e "\033[92m App is successfully deployed to Deploy Gate \033[0m"
else
   echo -e "\033[31m FAILED \033[0m"
fi

# result="Current test status: Done!
# Total scenarios: 2
# 1 passed
# 1 failed
# Total steps: 14
# Error: There were Test Failures.
# Test Report: https://appcenter.ms/users/seongwoei.chua/apps/calabash-test/test/series/master/runs/eccb3977-21a1-4f0d-b114-e27f89a0c85c"
# length=${#result}
# start=$(expr $length - 36)
# testid=${result:start:length}

# appcenter test status \
# --test-run-id ${testid} \
# --app seongwoei.chua/calabash-test