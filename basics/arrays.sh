#!/bin/bash

# Script that compare three list of arrays and write the common elements
# of all the three arrays

#creation of example arrays
a=(9 8 5 6 10)
b=(7 5 2 13 4)
c=(11 8 5 18)
common=()

#comparison
for a in "${a[@]}"; do
	for b in "${b[@]}" ; do
		for c in "${c[@]}"; do
			if [[ $a -eq $b && $b -eq $c ]]; then
			common+=($a)
			fi
		done
	done
done

#typing array with common elements
echo "Common elements: ${common[@]}"
