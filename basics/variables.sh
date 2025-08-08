#!/bin/bash

#asking for name
echo -n "Type your name: "
read name

#reading system name and current date to variables
system=$(uname)
date=$(date +"%A, %d %B")

#printing message with variables
echo "Hello, $name! Today is $date. You working on $system."
