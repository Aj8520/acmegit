#!/bin/bash

set -e

CUSTOMER="$1"
BUILD_PATH="$2"
DEPLOY_ALL="$3"
TOMCAT_USER="$4"
TOMCAT_PASSWORD="$5"

declare -A DEPLOY_CONFIGS=(
    ["Local-102"]="http://172.16.2.224:8080/mgt|default"
    ["png-test"]="http://49.248.142.90:8080|default"
    ["bhamburde"]="https://bhamburdekar.acmepadm.com:8443|default"
    ["rcb"]="https://rcb1.acmepadm.com,https://rcb2.acmepadm.com:8443,https://rcb92.acmepadm.com|default"
    ["mahindra"]="http://157.119.205.40:8080|default"
    ["ranka"]="https://ranka.acmepadm.com:8443|default"
    ["khimji"]="https://khimji.acmepadm.com:8443|default"
    ["vasundhara"]="http://183.82.103.110:8080|default"
    ["acme"]="https://hr.acmepadm.com:8443|default"
    ["ArgentumHouse"]="http://203.192.229.211:8080|default"
    ["jbp"]="https://jpearls.acmepadm.com:8443|default"
    ["JBSaraf"]="https://jbj1.acmepadm.com:8443|default"
    ["DemoAcme"]="https://demo.acmepadm.com:8443|default"
    ["Local-224"]="http://172.16.2.224:8080/mgt|default"
)

# Check if customer exists
if [[ -z "${DEPLOY_CONFIGS[$CUSTOMER]}" ]]; then
    echo "❌ Error: No deployment config found for customer '$CUSTOMER'"
    exit 1
fi

IFS='|' read -r SERVERS PROFILE <<< "${DEPLOY_CONFIGS[$CUSTOMER]}"
IFS=',' read -ra SERVER_LIST <<< "$SERVERS"

echo "🚀 Starting deployment for customer: $CUSTOMER"
echo "📂 WAR build path: $BUILD_PATH"
echo "👤 Tomcat user: $TOMCAT_USER"
echo "🌐 Servers: ${SERVER_LIST[*]}"
echo "🔧 Profile: $PROFILE"
echo "📦 Deploy all: $DEPLOY_ALL"

for SERVER in "${SERVER_LIST[@]}"; do
    echo "➡️ Deploying to $SERVER"

    if [[ "$DEPLOY_ALL" == "true" ]]; then
        ./deploy-all-wars.sh "$PROFILE" "$SERVER" "$TOMCAT_USER" "$TOMCAT_PASSWORD"
    else
        for WAR in "$BUILD_PATH"/*.war; do
            WAR_NAME=$(basename "$WAR")
            echo "📤 Deploying $WAR_NAME to $SERVER"
            ./deploy-all-wars.sh "$PROFILE" "$SERVER" "$TOMCAT_USER" "$TOMCAT_PASSWORD" "$WAR"
        done
    fi
done

echo "✅ Deployment complete."
