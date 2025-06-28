#!/bin/bash

# Usage: ./deploy-all-wars.sh <profile> <tomcat_url> <username> <password>
# Example: ./deploy-all-wars.sh default http://172.16.2.224:8080 tomcat acme

set -e

PROFILE=$1
TOMCAT_URL=$2
TOMCAT_USER=$3
TOMCAT_PASSWORD=$4

if [[ -z "$PROFILE" || -z "$TOMCAT_URL" || -z "$TOMCAT_USER" || -z "$TOMCAT_PASSWORD" ]]; then
  echo "❌ Usage: $0 <profile> <tomcat_url> <username> <password>"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WAR_DIR="$SCRIPT_DIR/../wars/$PROFILE"

echo "📦 Deploying WARs from $WAR_DIR to $TOMCAT_URL"

WAR_FILES=("$WAR_DIR"/*.war)
if [ ! -e "${WAR_FILES[0]}" ]; then
  echo "❌ No WAR files found in $WAR_DIR"
  exit 1
fi

for WAR in "${WAR_FILES[@]}"; do
  WAR_NAME=$(basename "$WAR" .war)

  CONTEXT_NAME=$(echo "$WAR_NAME" | sed 's/##.*//')
  CONTEXT_PATH="/${CONTEXT_NAME}"

  echo "➡️ Undeploying previous version at $CONTEXT_PATH (if any)"
  curl -s -o /dev/null -w "%{http_code}" -u "$TOMCAT_USER:$TOMCAT_PASSWORD" \
    "$TOMCAT_URL/text/undeploy?path=${CONTEXT_PATH}" || echo "⚠️ Could not undeploy (may not exist)"

  # Extract version from WAR name (e.g., acme-abc-web##0047.war → 0047)
  VERSION=$(echo "$WAR_NAME" | grep -o '##.*' | sed 's/##//')
  DEPLOY_URL="$TOMCAT_URL/text/deploy?path=${CONTEXT_PATH}&update=true"
  if [[ -n "$VERSION" ]]; then
    DEPLOY_URL+="&version=$VERSION"
  fi

  echo "🚀 Deploying $WAR to $DEPLOY_URL"
  curl --fail -u "$TOMCAT_USER:$TOMCAT_PASSWORD" -T "$WAR" "$DEPLOY_URL"

  echo "✅ Deployed $WAR_NAME to $CONTEXT_PATH"
done

echo "✅ All WARs deployed successfully."
