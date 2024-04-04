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
		hp=15
		strength=10
		agility=4
		magic=1
		;;
	2)
		type="Hunter"
                hp=10
                strength=7
                agility=10
                magic=3
                ;;
	3)
		type="Assassin"
                hp=10
                strength=7
                agility=8
                magic=5
                ;;
	4)
		type="Samurai"
                hp=12
                strength=11 
                agility=7
                magic=0
                ;;
	5)
		type="Mage"
                hp=8
                strength=5
                agility=5
                magic=12
                ;;
esac

echo "You have chosen the class $type. 
Your stats:
HP: $hp
STR: $strength
AGL: $agility
MAG: $magic"

sleep 3

echo "You died"

sleep 5

echo "or did you?"

sleep 3

echo "You woke up in a lonely cell"
echo "From above someone threw a key down"
echo "Do you want to take the key? (y/n)"

read key

if [[ $key == "y" ]]; then
	echo "Key picked up."
else
	echo "You died after 13 hours and 48 minutes because of hunger."
	exit 1
fi

echo "You go out of the cell and before you can realise it around you builds up a big forest."

sleep 2


#First battle

echo "First fight. Prepare to fight. To start fight press: (y/n)"

read start

if [[ $start == "y" ]]; then
        echo "Fight starts."
else
        echo "You gave up."
        exit 1
fi

echo "You attacked"

sleep 2

boar=$(( 10 - $strength ))
rem_life=$(( $boar - $strength ))
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
			echo "One level cost 100 Souls."
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
        		echo "You gave up."
        		exit 1
		fi

	echo "You attacked"
	orc_life=$(( 30 - $strength ))
	orc_rem_life=$(( $orc_life - $strength ))
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


#START Story
echo "You go along a road in the forest and find a woman lying unconscious on the ground."
sleep 1
echo "The woman wears a destroyed, old dress with fresh blood stains on it."
sleep 2
echo "What do you want to do?
	1. To wake the woman type: wake
	2. To kidnap and rob the woman type: steal
	3. To ignore the woman and go along your way type: ignore"

	read start_adventure

		case $start_adventure in

		1)
			wake_woman="wake"
		;;

		2)
			steal_woman="steal"
		;;

		3)
			ignore_woman="ignore"
		;;
		esac






#Boss battle

