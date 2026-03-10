#!/bin/sh

# KONFLUX_NAME=devops-tracer
# FOLDER_NAME=tracer
# QUAY_REPO_NAME=tracer

if [[ -z "$KONFLUX_NAME" || -z "$FOLDER_NAME" || -z "$QUAY_REPO_NAME" ]]; then
  echo "Error - missing required environment variable"
  exit 1
fi

cat devops-base-runner-pull-request.yaml | \
  sed "s/devops-base-runner/$KONFLUX_NAME/" | \
  sed "s/base-runner/$QUAY_REPO_NAME/" | \
  sed "s/base/$FOLDER_NAME/" > "$KONFLUX_NAME"-pull-request.yaml

cat devops-base-runner-push.yaml | \
  sed "s/devops-base-runner/$KONFLUX_NAME/" | \
  sed "s/base-runner/$QUAY_REPO_NAME/" | \
  sed "s/base/$FOLDER_NAME/" > "$KONFLUX_NAME"-push.yaml
