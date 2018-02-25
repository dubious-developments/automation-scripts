#!/usr/bin/env bash

cron_line="*/5 * * * * ssh-add ~/.ssh/unshacled_waterfall_rsa"
(crontab -l; echo "$cron_line") | crontab -
