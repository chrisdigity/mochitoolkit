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
#   Purge Nvidia Drivers and Cuda Installs - v1.0.0 by Chrisdigity
#
# Prerequisites: Ubuntu 16.04/18.04
#
# Simply run the script as an elevated user
#     `sudo ~/mochitoolkit/purge_nvc.sh`
#
#########
# Header
echo
echo "   _ __  _   _ _ __ __ _  ___     _ ____   _____ "
echo "  | '_ \| | | | '__/ _\` |/ _ \   | '_ \ \ / / __|"
echo "  | |_) | |_| | | | (_| |  __/   | | | \ V / (__ "
echo "  | .__/ \__,_|_|  \__, |\___|___|_| |_|\_/ \___|"
echo "  |_|              |___/    |_____|    -v1.0.0 by Chrisdigity"
echo
echo "Remove all Cuda Installations and Nvidia Drivers on the system"
echo
echo "You may be asked for your password to remove packages..."
sleep 5

# obtain Nvidia
nvidia=$(dpkg --get-selections | grep nvidia | awk '{print $1}' | tr '\n' ' ')

# obtain CUDA
cuda=$(dpkg --get-selections | grep cuda | awk '{print $1}' | tr '\n' ' ')

# remove
sudo apt remove -y --purge $nvidia $cuda

# remove remnants
sudo rm -rf /usr/local/cuda*

# cleanup
sudo apt autoremove -y
sudo apt autoclean

echo
echo Nvidia Drivers and Cuda Installations have been purged!
echo
exit
