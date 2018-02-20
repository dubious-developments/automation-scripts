#!/usr/bin/env bash

current_dir_path=$(dirname $0)

# Clear the crontab.
bash $current_dir_path/clear-crontab.sh

# Format: setup-mirror.sh \
#             source-username source-project \
#             target-username target-project \
#             source-website target-website

# Mirror the UnSHACLed client repo
bash $current_dir_path/setup-mirror.sh \
    dubious-developments UnSHACLed \
    dubious-developments UnSHACLed-client \
    github.com github.ugent.be

# Mirror the UnSHACLed client repo's wiki.
bash $current_dir_path/setup-mirror.sh \
    dubious-developments UnSHACLed.wiki \
    dubious-developments UnSHACLed-client.wiki \
    github.com github.ugent.be

# Mirror the UnSHACLed server repo.
bash $current_dir_path/setup-mirror.sh \
    dubious-developments UnSHACLed-server \
    dubious-developments UnSHACLed-server \
    github.com github.ugent.be
