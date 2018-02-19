#!/usr/bin/env bash

# Format: setup-mirror.sh \
#             source-username source-project \
#             target-username target-project \
#             source-website target-website \
#             [sudo]

# Initialize some variables
source_username=$1
source_project_name=$2
target_username=$3
target_project_name=$4
source_website=$5
target_website=$6
sudo_or_not=$7
mirror_script_path=$(pwd)/$1/mirror-$2.sh
user_path=$(pwd)/$1
clone_path=$user_path/$2.git
mkdir -p $user_path

# Mirroring script
cat << EOF > $mirror_script_path
cd $user_path
if [ ! -d "$clone_path" ]; then
  git clone --mirror https://$5/$1/$2
fi
cd $clone_path
git fetch --prune && git push --mirror git@$6:$3/$4.git
EOF
chmod +x $mirror_script_path

# crontab file
cron_line="*/5 * * * * $mirror_script_path >$user_path/mirror-log-$2 2>&1"
($7 crontab -l; echo "$cron_line") | $7 crontab -
