#!/bin/bash

x=0.25
y=0.25
random=1
while [ 1 -eq "$(echo "${x} < 7.75" | bc)" ] && [ 1 -eq "$(echo "${y} < 7.75" | bc)" ]; 
do
    random=`shuf -i 0-1 -n 1`
    if [ $random == 0 ]
    then
    	echo "$random" 
    	x=`echo $x + 0.25 | bc`
    else
    	echo "$random"
    	y=`echo $y + 0.25 | bc`
    fi
    	echo "$x, $y"
done


