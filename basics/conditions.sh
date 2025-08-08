#!/bin/bash

#This script asking user for path to file/directory and checking if that exist

#Asking user for path
echo -n "Type path here: "
read path

#Cheking if users path is file or directory
if [ -f $path ]; then
	echo "This is file."
elif [ -d $path ]; then 
	echo "This is directory."
else
	echo "No file exists at given path."
fi
