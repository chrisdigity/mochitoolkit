# Mochi Address - maddr

Ever wondered what address is really in your `maddr.dat` file? Well, wonder no more...

## Features

- Deciphers the Mochimo Address from a public address file
- By default, displays the first 64 hexadecimal characters
- Can display the FULL 2208 byte Mochimo Address, if it pleases you...
- Extra option to quickly check against the default `maddr.dat` file

## Prerequisites

You will need:

- A Mochimo Address file (`maddr.dat`)

## Install

See Mochi Toolkit [README](../README.md) for install instructions.

## Usage

Simply run the script

```bash
~/mochi/scripts/maddr
```

| Options | Option Description |
| --- | --- |
| -a, --address [file] | Set Address file to use |
| -f, --full | Display full Mochimo Address |
| -i, --isitstack | Check Address file against default `maddr.dat` |

## Mentions

- Thanks to AcroTiger for one liner posted in the Mochimo Official [Discord](https://discord.gg/G8YVFMt) to pull hex address from address files.
