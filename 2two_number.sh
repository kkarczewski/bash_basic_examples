#!/bin/bash



echo "Podaj a"

read a

echo "Podaj b"

read b


if [ $a -lt $b ] then

   echo "$b $a"

else

   echo "$a $b"

fi
