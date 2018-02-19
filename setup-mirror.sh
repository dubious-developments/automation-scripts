#!/usr/bin/env bash

# Format: setup-mirror.sh \
#             source-username source-project \
#             target-username target-project \
#             source-website target-website

# Initialize some variables
current_dir_path=$(dirname $0)

source_username=$1
source_project_name=$2
target_username=$3
target_project_name=$4
source_website=$5
target_website=$6
mirror_script_path=$(pwd)/$1/mirror-$2.sh
user_path=$(pwd)/$1

# Install infrastructure as regular user.
$current_dir_path/setup-mirror-infrastructure.sh \
  $1 $2 $3 $4 $5 $6 $user_path $mirror_script_path

# crontab file
cron_line="*/5 * * * * $mirror_script_path >$user_path/mirror-log-$2 2>&1"
(crontab -l; echo "$cron_line") | crontab -
