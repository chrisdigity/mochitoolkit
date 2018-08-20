## Mochi Autostart - mauto
Automagically run your Mochimo Node in the background from System Startup and retrieve it at any time.

### Features
 - Starts Mochimo Node with tmux on system startup
 - The first Bash terminal opened, after system startup, attaches the Mochimo Node
 - Allows the node to run in the background and be attached at any time with `--attach`
 - Can easily disabled at any time with `--uninstall`

### Prerequisites
You will need:
 - tmux (will install if not already)
 - priviledged access to /etc/profile (sudo, password during (un)installation)

### Install
See Mochi Toolkit [README](README.md) for inital install procedure. Then run: `./mauto --install` to setup autostart features for you Mochimo Node.

### Usage
Simply install the Autostart Script as above and restart your system. The first terminal window you open after a restart will attach to the Mochimo Node. To detach from the Mochimo Node, do `Ctrl^b + d` (Hold Ctrl while pressing 'b', let go of Ctrl, press 'd'). After detaching the node (or closing the terminal window) you may retrieve the node again by doing `./mauto --attach`.

| Options | Option Description |
| --- | --- |
| -a, --attach | Attach to running Mochimo Node |
| -i, --install | Install Mochi Autostart Script |
| -o, --once | Show Mochimo Node ONCE, after --run |
| -r, --run | Run Mochi Autostart Script |
| -u, --uninstall | Uninstall Mochi Autostart Script |

