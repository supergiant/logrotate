# logrotate
:exclamation: Currently, we're using `logtruncate-original.yaml`. This is rolled out in all regions, currently, but there are still ghost files filling up minions that it doesn't truncate (although we could easily make it do that). :exclamation:

(Fore more information on how logrotate works, see these guides: https://www.techrepublic.com/article/manage-linux-log-files-with-logrotate/, http://aarvik.dk/a-simple-guide-on-logrotate/)

# Setup

In order to change the files rotated (and other aspects of the rotation), edit logrotate.conf according to normal logrotate guidelines (for help, try https://linux.die.net/man/8/logrotate, or, for a thorough guide, check https://www.thegeekstuff.com/2010/07/logrotate-examples).

To adjust the cron job timing, edit the Dockerfile according to normal cron guidelines (for help, try https://opensource.com/article/17/11/how-use-cron-linux).

Once you commit here or push to this repo, a new image will be pushed to the Supergiant Docker Hub repo: https://hub.docker.com/r/supergiant/logrotate/tags/.

The logrotate DaemonSet is set to `imagePullPolicy: Always`, so you don't even need to redeploy after making changes. Simply delete old logrotate pods to schedule new ones with the new image, or perform a rolling upgrade.
