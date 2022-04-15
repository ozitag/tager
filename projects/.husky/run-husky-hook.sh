#!/bin/sh

HOOK_NAME=$1

WEB_HOOK=./web/.husky/$HOOK_NAME
ADMIN_HOOK=./admin/.husky/$HOOK_NAME

echo "Run '$HOOK_NAME' hook"

if [ -f "$WEB_HOOK" ]; then
  echo "Web: [$WEB_HOOK] is running..."
  cd web && .husky/$HOOK_NAME && cd ..
else
  echo "Web: File '$WEB_HOOK' is not found"
fi

if [ -f "$ADMIN_HOOK" ]; then
  echo "Admin: [$ADMIN_HOOK] is running..."
  cd admin && .husky/$HOOK_NAME && cd ..
else
  echo "Admin: File '$ADMIN_HOOK' is not found"
fi
