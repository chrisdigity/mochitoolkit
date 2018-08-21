## Mochi Autostart - mauto
Automagically run a Mochimo Node in the background from System Startup and retrieve it at any time.

### Features
 - Runs a Mochimo Node in the background on system startup
 - Attaches the Mochimo Node to the first bash terminal opened after startup
 - Allows the node to run in the background and be attached at any time with `--attach`
 - Allows running a custom startup script

### Prerequisites
You will need:
 - tmux (will install if not already)
 - priviledged access to /etc/profile (sudo, password during (un)installation)
 - a Mochimo Node installed in your home directory

### Download
See Mochi Toolkit [README](README.md) for inital download procedure. 

### Install
* Copy Mochi Autostart script to your Mochimo Node's scripts directory `$HOME/mochi/scripts`
* Install Mochi Autostart script: `$HOME/mochi/scripts/mauto --install`

### Usage
Once Mochi Autostart is installed, all you need to do is reboot and your Mochimo Node should start running in the background.
* Show your Mochimo Node with: `$HOME/mochi/scripts/mauto --attach`
* Hide your Mochimo Node with: `Ctrl^b + d` (Hold Ctrl while pressing 'b', let go of Ctrl, press 'd')

If you wish to use a custom startup script;
* Copy your custom startup script to your Mochimo Node's scripts directory `$HOME/mochi/scripts`
* Edit the `runc` variable in the Mochi Autostart Script to reflect the name of your script
* Uninstall Mochi Autostart: `$HOME/mochi/scripts/mauto --uninstall`
* Reinstall Mochi Autostart with 'custom' argument: `$HOME/mochi/scripts/mauto --install custom`

| Options | Option Description |
| --- | --- |
| -a, --attach | Attach to running Mochimo Node |
| -c, --changelog | Changelog and Version info |
| -i, --install [custom] | Install Mochi Autostart Script |
| -o, --once | Show Mochimo Node ONCE, after --run |
| -r, --run | Run Mochi Autostart Script |
| -rc, --runc | Run Custom Mochi Autostart Script |
| -u, --uninstall | Uninstall Mochi Autostart Script |

