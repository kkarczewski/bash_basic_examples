#!/bin/bash


# W jednej linii

#echo `factor {1..10000} | awk 'NF==2{print $2}'`


# Po jednym w linii

factor {1..10000} | awk 'NF==2{print $2}'
