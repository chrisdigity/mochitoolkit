# Mochi Toolkit
Helpful tools for Mochimo Nodes... hopefully...

Eventually I will have a bunch of scripts here that all do weird and wonderful(?) things.

***
## Mochi Installer - minst
Supposed to be an easy but handy installer for managing Mochimo Node installations.

### Features
 - Detects existing Mochimo Node installations
 - Can backup/restore important files (if existing installation is found)
 - Cleans up previous installations (if existing installation is found)
 - Can download the latest Mochimo Node version straight from GitHub
 - Stores multiple versions of Mochimo Node packages for selection before install
 - Can add custom compiler options ;)

### Prerequisites
For the installer to operate correctly, you'll probably need:
```
 - tar    Tape Archiver
 - gcc    C Compiler
 - git    You know this one ;)
```
But the installer will ask and attempt to install these anyway.

### Running the installer
Just run the installer from the scripts directory...
```
cd ./mochi/scripts
./minst
```
or anywhere really...
```
cd ~
./mochi/scripts/minst
```

### Running with options
 - `./minst -t`    Initialization Test, ends script after initialization checks. Likely not very useful :/
 - `./minst -c`    Display Changelog, this option will likely disappear in future versions...
 - `./minst -d`    Debug Mode, runs the installer in debug mode but I don't think I made it do anything -_-

***

# Bugs
Hit me up with your issues in the Mochimo Discord Community. Link below vvv

# License
This project is licensed under the Apache License 2.0 - see the [LICENSE.md](LICENSE) file for details

# Acknowledgments
* Mochimo (https://mochimo.org/)
* Mochimo Discord (https://discord.gg/G8YVFMt)
