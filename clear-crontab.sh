#!/usr/bin/env bash

# Clear the crontab
cat << EOF | crontab -
MAILTO=""
EOF