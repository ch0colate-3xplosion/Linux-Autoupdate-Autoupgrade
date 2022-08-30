#!/bin/bash
# Just a quick bash script to auto update and upgrade Debian instances!
echo "Now Updating Instance"
sudo apt update -y &> /dev/null

echo "Now Upgrading Instance"
sudo apt upgrade -y & /dev/null
