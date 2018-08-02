## Mochi Balance - mbal
Safe and secure way of getting the balance of a Mochimo address. It pulls the balance of the address from the ledger, using the cli Block Explorer, so you don't have to open the wallet to view your balance.

### Features
 - By default, pull address from existing maddr.dat file and searches it.
 - Can search any hex address
 - Can use custom executable files/locations

### Prerequisites
You will need:
```
 - A hex address (either specified or taken from an address file)
 - A Ledger (ledger.dat)
 - A Block Explorer (bx)
```

### How to run
From the scripts directory,
```
cd ./mochi/scripts
./mbal
```

### Run with options
 - `./mbal -b <location of block explorer>`        Set Block Explorer to use
 - `./mbal -l <location of ledger file>`           Set Ledger file to use
 - `./mbal -a <location of address file>`          Set Address file to use
 - `./mbal -h <hex address, even # characters>`    User selected hex address
 - `./mbal -d`    Debug Mode - Helps identify problems...

