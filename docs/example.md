## Example yaml file for environment map
```yaml
---
env_map:
  Environments-1: Environments-101
  Environments-2: Environments-102
  Environments-3: Environments-88
  Environments-4: Environments-89
  Environments-21: Environments-90
  Environments-103: Environments-105
  Environments-102: Environments-104
  Environments-141: Environments-91
```

## Example bash script to migrate variables between projects
```bash
#!/bin/bash

echo "Migrating from the project ${1}"
echo "Migrating to the project ${2}"

# Target the old server to fetch variables
source ~/target-old-octo.sh
echo "Fetching"
pypus get-vars-add-toshelf Default ${1} data/${1}_old-vars

# Transpose variables
echo "Transposing"
pypus transpose-from-shelf data/${1}_old-vars Variables data/old_gw_new_sqldba.yml data/${2}_transposed

# Target the new server to write variables
source ~/target-new-octo.sh
echo "Posting"
pypus set-vars-from-shelf SQLDBA ${2} data/${2}_transposed
```

## Environment Variable set script example
```bash
# Pypus Old Guidewire Octopus
export OCTOPUS_API_KEY=YOUR_KEY
export OCTOPUS_SERVER_URI='https://oldserver/api'
```
