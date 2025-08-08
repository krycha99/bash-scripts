#!/bin/bash

#This script:

# - Accepts two arguments:
#  $1 - user name, $2- number
# - Checks if both arguments are provided. If not, displays an error message.
# - Defines the multiply_by_two function, which:
#  Takes a single number as an argument, multiplies it by 2
#  and Displays the result.

#checks if both arguments are provided
if [ $# -lt 2 ]; then
	echo "Use: $0 name number"
	exit 1
fi

#assigning arguments to variavles
name=$1
number=$2

#function definition
multiply_by_two() {
	n=$1
	result=$((n *2))
	echo "Welcome, $name! Number $number multiplied by two is $result."
}

#function call
multiply_by_two "$number"
