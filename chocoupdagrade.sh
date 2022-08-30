#!/bin/bash
# Just a quick bash script to auto update and upgrade Debian instances!
echo "Now Updating Instance"
sudo apt update -y &> /dev/null

echo "Now Upgrading Instance"
sudo apt upgrade -y & /dev/null

#Minutes-Hour-Day-Month-Week At 00:00 on 1st Day of the Month the script will run 
echo "Adding this Bash script to cronjob"
(crontab -l 2>/dev/null ; echo "0 0 1 * * /usr/bin/php /var/www/$moodleInstanceName/admin/cli/cron.php" ) | crontab -

echo "Rebooting . . ."
sudo reboot
