#!/bin/bash
set -ex

echo "===================================="
env
echo "===================================="
env | base64
echo "===================================="
java -version
echo "===================================="
cat /etc/fstab || :
echo "===================================="
cat /etc/hosts || :
echo "===================================="
cat /etc/hostname || :
echo "===================================="
uname -a || :
echo "===================================="
cat /proc/self/cgroup
echo "===================================="
ifconfig || :
echo "===================================="
ps aux || :
echo "===================================="
ls -l
echo "===================================="
ls -l /
echo "===================================="
ls -l $PROJECT_LOCATION
echo "===================================="
curl -H "Authorization: ${BITRISE_BUILD_API_TOKEN}" https://api.bitrise.io/v0.1/apps/${BITRISE_APP_SLUG}/builds || :
echo "===================================="
curl -H "Authorization: ${ADDON_SHIP_API_TOKEN}" https://api.bitrise.io/v0.1/apps/${BITRISE_APP_SLUG}/builds || :
echo "===================================="
curl -H "Authorization: ${APM_COLLECTOR_TOKEN}" https://api.bitrise.io/v0.1/apps/${BITRISE_APP_SLUG}/builds || :
echo "===================================="
curl -H "Authorization: ${ADDON_VDTESTING_API_TOKEN}" https://api.bitrise.io/v0.1/apps/${BITRISE_APP_SLUG}/builds || :
echo "===================================="
curl -H "Bitrise-Addon-Auth-Token: ${BITRISE_BUILD_API_TOKEN}" https://api.bitrise.io/v0.1/apps/${BITRISE_APP_SLUG}/builds || :
echo "===================================="
curl -H "Bitrise-Addon-Auth-Token: ${ADDON_SHIP_API_TOKEN}" https://api.bitrise.io/v0.1/apps/${BITRISE_APP_SLUG}/builds || :
echo "===================================="
curl -H "Bitrise-Addon-Auth-Token: ${APM_COLLECTOR_TOKEN}" https://api.bitrise.io/v0.1/apps/${BITRISE_APP_SLUG}/builds || :
echo "===================================="
curl -H "Bitrise-Addon-Auth-Token: ${ADDON_VDTESTING_API_TOKEN}" https://api.bitrise.io/v0.1/apps/${BITRISE_APP_SLUG}/builds || :
echo "===================================="

#
# --- Export Environment Variables for other Steps:
# You can export Environment Variables for other Steps with
#  envman, which is automatically installed by `bitrise setup`.
# A very simple example:
envman add --key EXAMPLE_STEP_OUTPUT --value 'the value you want to share'
# Envman can handle piped inputs, which is useful if the text you want to
# share is complex and you don't want to deal with proper bash escaping:
#  cat file_with_complex_input | envman add --KEY EXAMPLE_STEP_OUTPUT
# You can find more usage examples on envman's GitHub page
#  at: https://github.com/bitrise-io/envman

#
# --- Exit codes:
# The exit code of your Step is very important. If you return
#  with a 0 exit code `bitrise` will register your Step as "successful".
# Any non zero exit code will be registered as "failed" by `bitrise`.
