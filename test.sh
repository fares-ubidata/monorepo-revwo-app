#!/bin/bash

# NEXUS_URL="${NEXUS_URL}/repository/flutter-apk"

NEXUS_URL="https://fcfa-62-72-97-221.ngrok-free.app/repository/flutter-apk"
NEXUS_USERNAME="admin"
NEXUS_PASSWORD="123456"

APPS=(
    # "application name;.apk;version" (separator > ;)
    "revwo;packages/revwo/build/app/outputs/flutter-apk/app-qa-release.apk;1.0.0"
    "revwo_delivery;packages/revwo_delivery/build/app/outputs/flutter-apk/app-qa-release.apk;1.0.0"
)

for app in "${APPS[@]}"; do
    IFS=';' read -ra item <<< "$app"

    APP_NAME="${item[0]}"
    APK_FILE="${item[1]}"
    APP_VERSION="${item[2]}"

    APP_PACKAGE="com/monorepo/${APP_NAME}"
    DEPLOY_URL="${NEXUS_URL}/${APP_PACKAGE}/${APP_VERSION}/${APP_NAME}-${APP_VERSION}.apk"

    curl -v -u "${NEXUS_USERNAME}:${NEXUS_PASSWORD}" --upload-file "${APK_FILE}" "${DEPLOY_URL}"
done
