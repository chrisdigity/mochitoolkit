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
#   Mochimo Address Checker - v1.1.0 by Chrisdigity
#
# Prerequisites: mochimo address file (maddr.dat)
#
# To run this script...
#  - Verify the variable 'dmochi' points to your mochimo/bin directory
#  - And simply run the script
#     `./maddr.sh`
# OR, to display the raw hexadecimal data...
#  - add "-f" to the script call
#     `./maddr.sh -r`
# OR, to check a specific address file...
#  - add the file to the end of the script call
#     `./maddr.sh ./mysecretfiles/mymochiaddress.dat`
#
############
# Variables
dmochi="$HOME/mochimo/bin"
fmochi="$dmochi/maddr.dat"
full=0

type=""
addr=""
tag=""
balance="none"
secret="none"
stack=""

usage () {
  echo
  echo "    Mochimo Address Script - v1.1.0 by Chrisdigity"
  echo
  echo "Prerequisites: mochimo address file    (maddr.dat)"
  echo "Usage:  ./maddr.sh [options] [file]    Mochimo Address Script"
  echo "    Options:"
  echo "        -h, --help        Display this message"
  echo "        -r, --raw         Display the RAW Mochimo hex"
  echo
  exit;
}
##########
# Execute
( [ "$1" = "-h" ] || [ "$1" = "--help" ] ) && usage
( [ "$1" = "-r" ] || [ "$1" = "--raw" ] ) && full=1 && shift
[ ! -z $1 ] && fmochi=$1

###############
# File Checks
[ ! -f $fmochi ] && echo "No such file: $fmochi" && usage
[ ! -r $fmochi ] && echo "Cannot read file: $fmochi" && usage

#######################
# Get the address type
[ $(du -b "$fmochi" | cut -f1) -eq 2208 ] && type="public"
[ $(du -b "$fmochi" | cut -f1) -eq 2216 ] && type="public w/balance"
[ $(du -b "$fmochi" | cut -f1) -eq 2248 ] && type="private"
[ "$type" = "" ] && echo "Unknown Mochimo address type: $fmochi" && exit

######################
# Get the address hex
addr="$(xxd -p $fmochi | tr -d '\n')";
[ "$addr" = "" ] && echo "Unknown Mochimo address format: $fmochi" && exit

[ $full -eq 1 ] && echo $addr && exit    # Exit if '-f' option applied

#######################
# Minimize address hex
addr2="$(echo $addr | cut -c1-64)"

######################
# Get the address tag
tag="$(echo $addr | cut -c4393-4416)"
[ "$tag" = "420000000e00000001000000" ] && tag="[default] $tag"
[ "$tag" = "" ] && echo "Unknown Mochimo tag format: $fmochi" && exit

######################
# Get the address balance
[ "$type" = "public w/balance" ] && balance="0x$(echo $addr | cut -c4417-4432)"
[ "$type" = "private" ] && balance="0x$(echo $addr | cut -c4417-4432)"

#########################
# Get the address secret
[ "$type" = "private" ] && secret="$(echo $addr | cut -c4433-4496)"

################################
# Check default Mochimo Address
default="dedcd9022c6e476683acb8ae30cb35cdbac0c6f8f05ed3781f1e132106a32af4"
default2="287a8fb298dbbedc5a112f9e128c056f0391c4f66441ecdb3b7d0a1cc0aa017c"
( [ "$default" = "$addr2" ] || [ "$default2" = "$addr2" ] ) &&
    stack="Yes (╯°□°)╯︵┻━┻ " || stack="No ＼(＾O＾)／";

##########################
# Display address details
echo "File: $fmochi"
echo "Type: $type"
echo "Hex: $addr2"
echo "Tag: $tag"
echo "Balance: $balance"
echo "Secret: $secret"
echo
echo "Is it Stack's... $stack"
echo

exit 0;
