# CPU temperature logger for Raspberry pi
## Requirements
- This script must run on a raspberry pi
- You must have vcgencmd available, and have the relevant permissions to run it, see below for more details.
- You must be this tall to ride B)

## Instructions
Download the script, replace the logfile path, and run `sh temperature.sh`.

## vcgencmd
This script uses `vcgencmd`, a tool for the raspberry pi's VideoCore GPU. This is included by default on Raspian, but you can install it on other distros using:

```shell
sudo apt-get update
sudo apt-get install libraspberrypi-bin
```

Unless you're running this script as root, you'll need to give your user permissions using this command:

```shell
sudo usermod -aG video $(whoami) && newgrp video
```

The first part of this adds the current user to the group "video", the second part is used for the command's changes to take effect.

## cronjob
To run this script every minute, edit your cron job list using `crontab -e`, and add this to the end:

```
*/1 * * * * /bin/bash /home/jessica/temp/temperature/temperature.sh
```
