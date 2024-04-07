#!/bin/bash

#Tutorial

echo "Please select starting class:
1 - Warrior
2 - Hunter
3 - Assassin
4 - Samurai
5 - Mage"

read class

case $class in

	1)
		type="Warrior"
		hp=17
		strength=12
		agility=5
		magic=1
		;;
	2)
		type="Hunter"
                hp=13
                strength=9
                agility=9
                magic=4
                ;;
	3)
		type="Assassin"
                hp=12
                strength=10
                agility=7
                magic=6
                ;;
	4)
		type="Samurai"
                hp=14
                strength=11
                agility=7
                magic=3
                ;;
	5)
		type="Mage"
                hp=11
                strength=6
                agility=6
		magic=12
                ;;
esac

echo "You have chosen the class $type.
Your stats:
HP: $hp
STR: $strength
AGL: $agility
MAG: $magic"

sleep 4

echo "You died"

sleep 4

echo "or did you?"

sleep 3

echo "You woke up in a lonely cell"
echo "From above someone threw a key down"
echo "Do you want to take the key? (y/n)"

read key

if [[ $key == "y" ]]; then
	echo "Key picked up."
else
	echo "You look at the key but you don't have any motivation to get up."
	echo "What is wrong, why did u hesistate? You roll over on the ground, trying to sleep."
	sleep 2
	echo "In the morning you look if the key is still there. You find it in the exect position like yesterday."
	echo "You slept not really bad, but you are hungry should you take up the key and go forward even if there is danger? (y/n)"
	read key2
	if [[ $key2 == "y" ]]; then
        	echo "Key picked up."
	else
		echo "After 2 days you were so angry that you kicked the key out of the cell and you died after 4 days."
		exit 1
	fi
fi

echo "You open the door and the only thing you see is darkness. You look around to find a torch
or something that helps you to find out where you are."
sleep 5
echo "After a few steps you find a more open space with a broken wall. You can see the land around you with
a beautiful moon deep in the night. You try to recognise where you are but not a chance. You move forward."
sleep 5
echo "The security room is before you. You see a short sword on the table."
echo "Do you want to pick up the short sword? (y/n)"
read tutorial_items
	if [[ $tutorial_items == "y" ]]; then
		echo "Short Sword picked up."
	else
		echo "You took the sword anyway because of the danger you feel."
	fi
sleep 2

tut_sword=$(( $RANDOM % 5 ))

echo "As you go along the small passage you hear a growling."
sleep 2
echo "The nearer you come the louder is gets but you recognise the sound of this monster."
sleep 2
echo "No not a monster its a Boar, it has seen you!"

#First battle

echo "First Battle. Prepare to fight. To start fight press: (y/n)"

read start

if [[ $start == "y" ]]; then
        echo "Fight starts."
else
        echo "You gave up."
	echo "Boar ran you over."
        exit 1
fi

echo "You attacked"

sleep 2

boar=$(( 10 - $strength - $tut_sword ))
rem_life=$(( $boar - $strength - $tut_sword ))
attack_boar=$(( $hp - $RANDOM % 5 ))
life=$attackboar


if [[ $boar -le 0 ]]; then
	echo "Boar slained! 100 Souls gained!"
	souls=100
else
	echo "Boars remainig health is $boar"
	echo "Boar attacked"
	sleep 2
	echo "Your reamining health is $attack_boar"
	echo "Do you want to attack again?: (y/n)"
	read slain_boar

	if [[ $slain_boar == "y" ]]; then
        	echo "You attacked"
		echo "Boars remaining life is $rem_life"
                if [[ $rem_life -le 0 ]]; then
                        echo "Boar slained! 100 Souls gained!"
			souls = 100
        	else
			echo "Boar ran you over"
			echo "You died"
			exit 1
		fi
	else
		echo "You died"
		exit 1
	fi
fi

echo "You finished your first battle and harvest the Materials."

sleep 2

echo "You picked up 2 Boar meat"
sleep 3
echo "You look around in the forest, hoping to find something"
echo "In the distance you see a small cave do you want to enter (y/n):"
read enter

#First heal and safepoint

if [[ $enter == "y" ]]; then
	echo "You found a campfire. Do you want to rest here? (y/n)"
		read rest
		if [[ $rest == "y" ]];then
			echo "Your current souls are $souls"
			echo "You are healed. Your Health is now $hp"
			echo "Do you want so invest your skill points? (y/n)"
			echo "One level costs 100 Souls."
			read skilling

		#Skill system

			if [[ $skilling == "y" ]]; then
				echo " Job = $type
				       HP = $hp
 				       STR = $strength
				       AGL = $agility
				       MAG = $magic"

				echo "What do you want to skill?
				      Type:
					1 - HP
                                        2 - STR
					3 - AGL
					4 - MAG"

				read skill

				while [[ $skill = "1" ]]
				do
					read -p "Press enter to confirm"
				        hp=$(( $hp + 1 ))
					echo "You skilled HP"
					break
				done

				while [[ $skill = "2" ]]
                                do
					read -p "Press enter to confirm"
                                        strength=$(( $strength + 1 ))
                                        echo "You skilled STR"
					break
                                done

				while [[ $skill = "3" ]]
                                do
					read -p "Press enter to confirm"
                                        agility=$(( $agility + 1 ))
                                        echo "You skilled AGL"
					break
                                done

				while [[ $skill = "4" ]]
                                do
					read -p "Press enter to confirm"
                                        magic=$(( $magic + 1 ))
                                        echo "You skilled MAG"
					break
                                done

				echo "You spent 100 Souls!"
				new_souls=$(( $souls - 100 ))

				echo " 
				       Job = $type
                                       HP = $hp
                                       STR = $strength
                                       AGL = $agility
                                       MAG = $magic"
				echo " Your souls: $new_souls"
			else
				echo "Are you sure you want to stop?"
				read -p "Press enter to confirm"
				echo "You lie down on the ground to sleep and wake up early in the morning from beautiful birds melody." 
			fi

		else
			echo "You died of hunger after you left the forest"
			exit 1
		fi
else
	echo "You go through the forest and see a big grass land around you."
	echo "Before you appears a Demonic Orc"
	echo "Prepare to fight. To start fight press: (y/n)"

	read orc

	#Orc Battle

		if [[ $orc == "y" ]]; then
        		echo "Fight starts."
		else
        		echo "You gave up. Orc crushed you."
        		exit 1
		fi

	echo "You attacked"
	orc_life=$(( 50 - $strength - $tut_sword ))
	orc_rem_life=$(( $orc_life - $strength - $tut_sword ))
	attack_orc=$(( $life - $RANDOM % 12 ))
	sec_attack_orc=$(( $attack_orc - $RANDOM % 12 ))

		if [[ $orc_life -le 0 ]]; then
        		echo "Demonic Orc slained! 1000 Souls gained!"
        		new_souls=$(( $souls + 1000 ))
		else
        		echo "Orcs remainig health is $orc_life"
        		echo "Orc attacked"
        		sleep 2
        		echo "Your reamining health is $attack_orc"
				if [[ $attack_orc -le 0 ]]; then
					echo "You died!"
					exit 1
				else
        				echo "Do you want to attack again?: (y/n)"
        				read slain_orc

        					if [[ $slain_orc == "y" ]]; then
                					echo "You attacked"
                					echo "Orcs remaining life is $orc_rem_life"
                						if [[ $orc_rem_life -le 0 ]]; then
                        						echo "Demonic Orc slained! 1000 Souls gained!"
                        						new_souls=$(( $souls + 1000 ))
                						else
                        						echo "Orc got really angry and swang his axe all around"
                        						echo "You died"
                        						exit 1
                						fi
        					else
                					echo "You died"
                					exit 1
        					fi
				fi
		fi
fi

#Tutorial END

echo "You get out of the cave and look around."

#START Story

echo "You go along a road in the forest and find a woman lying unconscious on the ground."
sleep 1
echo "The woman wears a destroyed, old dress with fresh blood stains on it."
echo "She seems rather clean and and not sick. May say even pretty."
sleep 2
echo "What do you want to do?
	1. To wake the woman
	2. To kidnap and rob the woman
	3. To ignore the woman and go along your way"

	read start_adventure

while [[ $start_adventure = "1" ]]
do
	read -p "Press enter to confirm"
	echo "You shake the woman but she doesn't open her eyes. You can feel her hearthbeat that means she is still alive."
        sleep 2
        echo "You decide to bring her to the cave."
        echo "You decide to sleep until the woman wakes up"
        break
        done
while [[ $start_adventure = "2" ]]
do
        read -p "Press enter to confirm"
	echo "You took the woman on your shoulder and went to the cave."
        echo "Inside the cave you search her bag and find some bread, 3 gold coins and a bow with no arrows."
        echo "You wait until the woman wakes up because you mistrust."
        break
        done
while [[ $start_adventure = "3" ]]
do
        read -p "Press enter to confirm"
	echo "You go along the road and find a beautiful beast."
        break
        done




#Boss battle

