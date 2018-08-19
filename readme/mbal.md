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

### Usage
Simply run the script from any location
```
./mbal
or
$HOME/mochi/scripts/mbal
```

| Options | Option Description |
| --- | --- |
| -a, --address [file] | Set Address file to use |
| -b, --bx [file] | Set Block Explorer to use |
| -h, --hex [hex address] | User selected hex address |
| -l, --ledger [file] | Set Ledger file to use |

