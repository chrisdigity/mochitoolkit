## Mochi Balance - mbal
Safe and secure way of obtaining the balance of a Mochimo address. It displays the balance of a Mochimo Address by using the CLI Block Explorer and a Ledger file. Especially useful if your wallet is giving you "Balance Check errors" or if you just like being ~~lazy~~ efficient.

### Features
 - Obtains address from Mochimo Node's maddr.dat file.
 - Can lookup balance of any hex address or Mochimo Address file
 - Can use custom executable files/locations

### Prerequisites
You will need:
 - The CLI Block Explorer (bx)
 - A Current Ledger file (ledger.dat)
 - A Hex Address or Mochimo Address file (maddr.dat)

### Install
See Mochi Toolkit [README](README.md) for install instructions.

### How to run
Simply run the script from any location
```
./mbal
or
$HOME/mochi/scripts/mbal
```

### Options
 - `-a <location of address file>`          Set Address file to use
 - `-b <location of block explorer>`        Set Block Explorer to use
 - `-h <hex address, even # characters>`    User selected hex address
 - `-l <location of ledger file>`           Set Ledger file to use
