#! /bin/bash
#snake and ladder

echo "Welcome to snake and ladder game:"
echo "================================="
dice_roll_val=$(($(($RANDOM%6))+1));
echo "you got $dice_roll_val"
option=$(($(($RANDOM%3))+1));
if [[ $option -eq 1 ]];
then
	echo "no play"
elif [[ $option -eq 2 ]];
then
	echo "got ladder"
else
	echo "got snake"
fi
