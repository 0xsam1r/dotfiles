#!/bin/bash
# main process
	# read input, inial counter for valid paths
	# handle inputs path, commands exit, ps,.... {while + case }
	# ps print counter 
	# print number of valid paths and end the script
# check (function)
	# check if path exist using if
	# check type of path
	# print the meta data using stat cammand
	# increase counter
clear
counter=0
echo "Welcome to path Analyzer :)"
check() {
	path=$1

	if [[ -e $path ]] ; then 
		echo "oh!! $path is valid"
		((counter++))
		[[ -d $path ]] && echo "Oh! $path is a directory"
		[[ -f $path ]] && echo "Oh! $path is a file"
		stat $path
	else
		echo "$path not exist"
	fi 
}

while [[ $path != "-exit" ]] ; do
	read -p "PATH> " path
	case $path in
		"-ls")
				ls ;;
		"-clear")	
	       		clear ;;
		"-help")
			echo "enter path to analysis"
			echo "commands {-help, -clear, -ps, -exit}"
			;;
		"-exit")
			echo "======================="
			echo "Valid paths: $counter" "BYE!....."
			echo "======================="
			exit ;;
		"-ps")	
			echo "Valid paths number: $counter" ;;
		*)
			check $path ;;
	esac
done


		
