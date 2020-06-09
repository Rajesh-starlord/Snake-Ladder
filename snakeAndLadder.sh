#! /bin/bash
#snake and ladder

echo "Welcome to snake and ladder game:"
echo "================================="

DESTINATION=100
player1_position=0
player2_position=0
dice_roll_count1=0
dice_roll_count2=0

function rollDice() {

	player="$1"
	player_position=$2
	
	while [[ $player_status == "continue" ]]
	do
		
		dice_roll_val=$(($(($RANDOM%6))+1));
		
		if [[ $player == "player1" ]];
		then
			dice_roll_count1=$(($dice_roll_count1+1))
		else
			dice_roll_count2=$(($dice_roll_count2+1))
		fi
		
		echo "$player got $dice_roll_val"
		option=$(($(($RANDOM%3))+1));
		
		if [[ $option -eq 1 ]];
		then
			echo "no play"
			echo "$player at position:$player_position"
			echo "---------------------"
			player_status="stop"
		elif [[ $option -eq 2 ]];
		then
			echo "got ladder"
			if [[ $(($player_position+$dice_roll_val)) -gt 100 ]];
			then
				player_position=$player_position
				echo "$player at position:$player_position"
				echo "---------------------"
			elif [[ $(($player_position+$dice_roll_val)) -eq 100 ]];
			then
				player_position=$(($player_position+$dice_roll_val))
				echo "$player at position:$player_position"
				echo "---------------------"
				player_status="stop"
			else
				player_position=$(($player_position+$dice_roll_val))
				echo "$player at position:$player_position"
				echo "---------------------"
			fi
		else
			echo "got snake"
			player_position=$(($player_position-$dice_roll_val))
			if [[ $player_position -lt 0 ]];
			then
				player_position=0;
			fi
			echo "$player at position:$player_position"
			echo "---------------------"
			player_status="stop"
		fi
	done
	return $player_position
}

while [ $player1_position -lt $DESTINATION ] && [ $player2_position -lt $DESTINATION ]
do
	rollDice "player1" $player1_position
	player1_position=$?
	player_status="continue"
	if [[ $player1_position -ne 100 ]];
	then
		rollDice "player2" $player2_position
		player2_position=$?
		player_status="continue"
	fi
done

echo "================================================"
echo "player1 rolled the dice $dice_roll_count1 times "
echo "player2 rolled the dice $dice_roll_count2 times "
echo "================================================"
if [[ $player1_position -eq 100 ]];
then
	echo "player1 won the match"
elif [[ $player2_position -eq 100 ]];
then
	echo "player2 won the match"
fi
	