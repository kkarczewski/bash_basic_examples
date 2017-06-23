#!/bin/bash


read count

a=1

while [ $a -le $count ]

do

    if [ $(($a%3)) -eq 0 -a $(($a%5)) -ne 0 ]

    then

        echo 'FIZZ'
    
    elif [ $(($a%3)) -ne 0 -a $(($a%5)) -eq 0 ]

    then

        echo 'BUZZ'

    elif [ $(($a%3)) -eq 0 -a $(($a%5)) -eq 0 ]

    then

        echo 'FIZZBUZZ'
    
    else

        echo $a
    fi
    a=$(($a+1))

done
