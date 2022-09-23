#!/bin/bash
echo "elder:                -welcome to the man who calls himself \"hero\""
sleep 3
echo "narrator:             -with a scornful laughter, the elder asks you what is your life path"
sleep 3
echo "narrator:             -answer according to the options below:
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
      echo "the $type hero casts $skill on the beast, for a total of $attack damage points."
      sleep 3
      beast_hp=$(( $beast_hp - $attack))       
      echo "the beast's hp now is $beast_hp"
       
      if [[ $beast_hp = 0 ]]; then
            beast_hp=20
            true_hp=$hero_hp
            echo "you have slayed the beast, hero, but I bet you won't be as lucky next time"
            sleep 3
      fi
      else
          echo "beast angrily stomps the hero for a total of $beast_attack damage points"
          sleep 3
          true_hp=$(( $true_hp - $beast_attack ))
          echo "hero's hp is now $true_hp"
          
          if [[ $true_hp = 0 ]]; then
              echo "you died"
              sleep 2
              echo "as expected"
              exit
          fi
fi

done
