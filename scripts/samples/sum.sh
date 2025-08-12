#!/bin/bash

sum=0

while [[ $input != "sum" ]] ; do
	sum=$(( sum+input ))
	read -p "Enter a number (sum to end) >" input
done
