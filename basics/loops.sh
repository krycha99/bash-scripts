#!/bin/bash

#Password generator with length validation

#Script asks user for number, check its correctness and then generates 
#a password of the length specified by the user.

#Asks the user to enter the password length
while true; do
	read -p "Enter password length (min. 4 characters): " LENGTH

	#check if it's number
	if [[ ! "$LENGTH" =~ ^[0-9]+$ ]]; then
		echo "X This is not the number"
		continue
	fi

	#check if number is big enough
	if [[ "$LENGTH" -lt 4  ]]; then
		echo "X Password must be at least 4 characters long"
		continue
	fi

	#if everything is correct, we break the loop
	break
done

#generating password with users length
echo -n "Generated password: "
for ((i=1; i<=$LENGTH; i++)); do
	char=$(tr -dc 'A-Za-z0-9' </dev/urandom | head -c 1)
	echo -n "$char"
done 

echo ""
