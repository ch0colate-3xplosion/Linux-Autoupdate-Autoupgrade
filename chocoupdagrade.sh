#!/bin/bash
# Just a quick bash script to auto update and upgrade Debian instances!
echo "Now Updating Instance"
sudo apt update -y &> /dev/null

echo "Now Upgrading Instance"
sudo apt upgrade -y & /dev/null

echo "Creating new Bash script to run on root folder as root"
touch /root/linuxautoupdaupgrademe.sh
cat > /root/linuxautoupdaupgrademe.sh << EOF
echo "Now Updating Instance"
sudo apt update -y &> /dev/null

echo "Now Upgrading Instance"
sudo apt upgrade -y & /dev/null

echo "Rebooting Now..."
sudo reboot
EOF

echo "Changing Bash Script ownership to Root"
chown -R root /root/linuxautoupdaupgrademe.sh

echo "Changing Bash Script Permissions"
chmod 700 /root/linuxautoupdaupgrademe.sh

#Minutes-Hour-Day-Month-Week At 00:00 on 1st Day of the Month the script will run 
echo "Adding this Bash script to cronjob"
(crontab -l 2>/dev/null ; echo "0 0 1 * * /root/linuxautoupdaupgrademe.sh" ) | crontab -

echo "Rebooting Now..."
sudo reboot
