#!/bin/sh
#
#   Copyright 2018 Chrisdigity
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
# #####################################################################
#
#   Install Mochimo GPU Mining dependencies - v1.0.0 by Chrisdigity
#
# Prerequisites: Ubuntu 16.04 LTS
#
# Simply run the script as an elevated user
#     `sudo ~/mochitoolkit/install_nvcu16.sh`
#
#########
# Header
echo "   _           _        _ _                          _  __   "
echo "  (_)_ __  ___| |_ __ _| | |    _ ____   _____ _   _/ |/ /_  "
echo "  | | '_ \/ __| __/ _\` | | |   | '_ \ \ / / __| | | | | '_ \ "
echo "  | | | | \__ \ || (_| | | |   | | | \ V / (__| |_| | | (_) |"
echo "  |_|_| |_|___/\__\__,_|_|_|___|_| |_|\_/ \___|\__,_|_|\___/ "
echo "                          |_____|    -v1.0.0 by Chrisdigity"
echo
echo "Install Mochimo GPU mining dependencies on Ubuntu 16.04 LTS"
echo "    - Cuda 9.2 and appropriate Nvidia Driver"
echo
echo "You may be asked for your password to install packages..."
sleep 5

# Download/Overwrite Cuda 9.2 debian package
rm ~/cuda-9-2.deb
wget -O ~/cuda-9-2.deb https://developer.nvidia.com/compute/cuda/9.2/Prod2/local_installers/cuda-repo-ubuntu1604-9-2-local_9.2.148-1_amd64

# Install debian package
sudo dpkg -i ~/cuda-9-2.deb

# Add key
sudo apt-key add /var/cuda-repo-9-2*/7fa2af80.pub

# Install
sudo apt update
sudo apt install -y build-essential linux-headers-$(uname -r) cuda

# Alert 
echo
echo "Your system will reboot in 10 seconds to finalize installation."
echo "Press Ctrl^c to abort..."
echo
sleep 10

# Reboot 
sudo reboot


exit
