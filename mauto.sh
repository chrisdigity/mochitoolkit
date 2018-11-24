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
#   Mochimo Autostart - v1.3.0 by Chrisdigity
#
# Prerequisites: mochimo node (https://github.com/mochimodev/mochimo)
#                tmux (sudo apt install tmux)
#
# To install this script...
#  - Verify the variable 'dmochi' points to your mochimo/bin directory
#  - Verify the variable 'mochi' executes the desired command
#
#  - For Desktop Environment (Ubuntu);
#    Search -> Startup Applications -> Add button
#    Give it a name (and comment if you wish)
#    Command: gnome-terminal -x sh -c '~/mochitoolkit/mauto.sh;exec bash'
#
#  - For Server Environment;
#    Open '.bashrc' with your favourite editor
#      `nano ~/.bashrc`
#    Add script to the bottom
#      `~/mochitoolkit/mauto.sh`
#
############
# Variables
dmochi="$HOME/mochimo/bin"   # mochimo bin directory (MUST BE FULL PATH)
mochi="./gomochi d"          # start command
notimeout=0                  # network error

##########
# Execute
if ! $(tmux has-session -t mochimo)             # Check mochimo node
then
  printf "Network connectivity check... "
  for i in {1..20}; do sleep 3
    if ping -c1 google.com >/dev/null 2>&1; then
      printf "OK\n"
      notimeout=1
      break
    fi
  done
  if [ $notimeout -eq 1 ]
  then
    tmux new -s mochimo -c $dmochi -d "$mochi"  # Start mochimo node
    tmux attach -t mochimo                      # Attach to session
  else
    printf "Timeout!\n"
  fi
else
  echo "A Mochimo session already exists"
  echo "Try: tmux attach -t mochimo"
fi

exit 0;
