#!/usr/bin/env bash

# Format: setup-mirror-infrastructure.sh \
#             source-username source-project \
#             target-username target-project \
#             source-website target-website \
#             mirror-directory mirror-script-path

# Initialize some variables
source_username=$1
source_project_name=$2
target_username=$3
target_project_name=$4
source_website=$5
target_website=$6
user_path=$7
mirror_script_path=$8

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
