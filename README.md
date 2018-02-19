# automation-scripts
Scripts we use to automate our workflow.

## Usage

To mirror all repositories from GitHub to UGent's private GitHub, [register a deploy key](https://developer.github.com/v3/guides/managing-deploy-keys/) for each repo that we mirror and then run `./automation-scripts/setup-server.sh` to set up a mirroring `cron` task. After that, you should be all set.
