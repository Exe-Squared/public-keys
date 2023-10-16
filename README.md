# Public Keys Deploy Script

This system is used to deploy public keys to servers allowing SSH access

1. Add your public SSH key into the repo directory

2. Add the name of your public key into the FILES array in deploy_public_keys.sh
```shell
FILES=("key1.pub") # Before addition of new key
FILES=("key1.pub" "key2.pub") # After addition of new key (ensure no commas between array items)
```
To run the script from a server, run:
```shell
$ curl "https://raw.githubusercontent.com/Exe-Squared/public-keys/main/deploy_public_keys.sh" | bash
```
**This will overwrite the existing ```root/ssh/authorized_keys``` file**
