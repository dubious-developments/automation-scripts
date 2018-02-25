#!/usr/bin/env bash

cron_line="*/5 * * * * ssh-add $1"
(crontab -l; echo "$cron_line") | crontab -
