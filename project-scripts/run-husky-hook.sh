#!/bin/sh

HOOK_NAME=$1
HUSKY_FOLDER=.husky

WEB_HOOK=./web/$HUSKY_FOLDER/$HOOK_NAME
ADMIN_HOOK=./admin/$HUSKY_FOLDER/$HOOK_NAME

echo "Run '$HOOK_NAME' hook"

  if [ -f "$WEB_HOOK" ]; then
    echo "Web: [$WEB_HOOK] is running..."
    $WEB_HOOK
  else
    echo "Web: File '$WEB_HOOK' is not found"
  fi

  if [ -f "$ADMIN_HOOK" ]; then
    echo "Admin: [$ADMIN_HOOK] is running..."
    $ADMIN_HOOK
  else
    echo "Admin: File '$ADMIN_HOOK' is not found"
  fi
