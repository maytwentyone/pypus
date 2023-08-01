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
