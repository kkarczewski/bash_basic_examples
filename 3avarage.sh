#!/bin/bash


echo "Podaj liczbę danych"

read count
a=0

sum=0

while [ $a -lt $count ]

do

   read one

   a=$(($a+1))

   sum=$(($sum+$one))

done



echo $((100*$sum/$count)) | sed 's/..$/.&/'
