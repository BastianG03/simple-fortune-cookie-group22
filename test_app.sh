set -euo pipefail
URL="$1"
echo "Testing $URL ..."
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
if [ "$STATUS" -eq 200 ]; then
  echo "App is healthy"
  exit 0
else
  echo "App test failed: HTTP $STATUS"
  exit 1
fi
