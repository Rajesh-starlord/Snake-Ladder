#! /bin/bash
#snake and ladder

echo "Welcome to snake and ladder game:"
echo "================================="

DESTINATION=100
player_position=0;

while [ $player_position -lt $DESTINATION ]
do
	dice_roll_val=$(($(($RANDOM%6))+1));
	echo "you got $dice_roll_val"
	option=$(($(($RANDOM%3))+1));
	if [[ $option -eq 1 ]];
	then
		echo "no play"
		echo "player at position:$player_position"
	elif [[ $option -eq 2 ]];
	then
		echo "got ladder"
		player_position=$(($player_position+$dice_roll_val))
		echo "player at position:$player_position"
	else
		echo "got snake"
		player_position=$(($player_position-$dice_roll_val))
		if [[ $player_position -lt 0 ]];
		then
			player_position=0;
		fi
		echo "player at position:$player_position"
	fi
done
