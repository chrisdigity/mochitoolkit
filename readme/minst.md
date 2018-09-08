# Mochi Installer - minst

Supposed to be an easy but handy installer for managing Mochimo Node installations.

## Features

- Detects existing Mochimo Node installations
- Can backup/restore important files (if existing installation is found)
- Cleans up previous installations (if existing installation is found)
- Can download the latest Mochimo Node version straight from GitHub
- Stores multiple versions of Mochimo Node packages for selection before install
- Can add custom compiler options ;)

## Prerequisites

For the installer to operate correctly, you'll probably need:

```text
 - tar    Tape Archiver
 - gcc    C Compiler
 - git    You know this one ;)
 - Ubuntu/Debian/Fedora/Red Hat
```

But the installer will ask and attempt to install these anyway.

## Running the installer

Just run the installer from the scripts directory...

```bash
~/mochi/scripts/minst
```

## Running with options

- `./minst -t` - Initialization Test, ends script after initialization checks. Likely not very useful :/
- `./minst -c` - Display Changelog, this option will likely disappear in future versions...
- `./minst -d` - Debug Mode, runs the installer in debug mode but I don't think I made it do anything -_-
