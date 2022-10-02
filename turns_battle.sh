#!/bin/bash
sleep 2
echo "elder:      -welcome to the man who calls himself \"hero\""
sleep 2
echo "narrator:   -with a scornful laughter, the elder asks you what is your life path"
sleep 2
echo "narrator:   -answer 1, 2 or 3 according to the options below:
1 - samurai
2 - prophet
3 - tanker"

read class

case "$class" in
  1) 
    type="samurai" 
    hero_hp=5
    attack=20
    skill="katana slash"
    ;;
  2) 
    type="prophet"
    hero_hp=20
    attack=10
    skill="doom prophecy"
    ;;
  
  3) 
    type="tanker"
    hero_hp=40
    attack=5
    skill="heavy shoulder dash"
  ;;
esac

echo "you've chosen the $type class"
sleep 1
echo "your hp is $hero_hp"
sleep 1
echo "and your attack is $attack"
sleep 1

beast_attack=5
beast_hp=20
true_hp=$hero_hp

echo "A feral beast approaches." 
sleep 2

while [[ $true_hp != 0 ]]; do

echo "Prepare to battle. Pick a number between 0 and 1. (0/1)"
read hero_odds
beast_odds=$(( $RANDOM % 2))

if [[ $beast_odds == $hero_odds ]]; then
      # the next message will be echoed on the green ansi color:
      echo -e "\e[32mHero casts $skill on the beast for a total of $attack damage points\e[0m"
      beast_hp=$(( $beast_hp - $attack))       
      echo -e "\e[32mthe beast's hp now is $beast_hp\e[0m"
       
      if [[ $beast_hp = 0 ]]; then
            beast_hp=20
            true_hp=$hero_hp
            # the next message will be echoed on the cyan blue ansi color:
            echo -e "            \e[36mYou've defeated the beast. 
            Your hp has been recovered and you can now keep going forward... 
            but I bet you won't be as lucky next time\e[0m"
            sleep 3
      fi
      else
          # the next message will be echoed on the red ansi color:
          echo -e "\e[31mThe beast angrily stomps the hero for a total of $beast_attack damage points\e[0m"

          sleep 3
          true_hp=$(( $true_hp - $beast_attack ))
          echo -e "\e[31mhero's hp is now $true_hp\e[0m"
          
          if [[ $true_hp = 0 ]]; then
              echo "you died"
              sleep 2
              echo "as expected"
              exit
          fi
fi

done
