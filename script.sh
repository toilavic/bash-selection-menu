#!/bin/bash
echo '*********************************************************************'
echo 'Please choose from the following options; type the option
number and hit the <Enter> key.'
echo 'a or A To display the current directory'
echo 'b or B To list names of the files in a given directory'
echo "c or C To display today's date and time"
echo 'd or D To display whether a file is a simple file or directory'
echo 'e or E To execute a command line.'
echo 'q or Q To exit the program.'
echo '*********************************************************************'

press_enter()
{
    echo -en "\nPress Enter to continue"
    read
    clear
}

#Exercise a.Display the present working directory
currentDirectory=$(pwd)

while true; do
        printf 'Enter your choice and hit <Enter> : '
        read -r ANSWER

        case $ANSWER in
	
	#Show the current dirrectory
        [aA] )
                echo $currentDirectory
                press_enter
		;;

	#Show the files name in from stdin directory
	[bB] )
		printf 'Please enter the directory path: '
		read -r search_dir
		for entry in "$search_dir"/*
		do
 			echo "$entry"
		done
		press_enter
		;;
	#Show the current date, time
	[cC] )
		dateTime=$(date)
		echo "$dateTime"
		press_enter
		;;
	#Check whether stdin is file or folder
	#folder must be given with quote /
	[dD] )
		printf "Please enter file name: "
		read -r fileName
		if [[ -d $fileName ]]; then
   			 echo "$fileName is a directory"
		elif [[ -f $fileName ]]; then
    			echo "$fileName is a file"
		else
    			echo "$fileName is not valid"
		fi
		press_enter
		;;
	#execute the command line directly
	[eE] )
		printf "Please enter a command to be executed: "
		read -r command
		$command
		press_enter
		;;
	#exit the program
        [qQ] )
                echo "Bye, now";
                break
                ;;
        *) echo "Invalid input"
            ;;
        esac
done
