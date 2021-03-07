#!/bin/bash

date=$1
time=$2
ampm=$3
game=$4

cat *$date* | grep $time |

case $game in
        roulette)
        awk '{print $1, $2, $5, $6}'
        ;;
        blackjack)
        awk '{print $1, $2, $3, $4}'
        ;;
        texas)
        awk '{print $1, $2, $7, $8}'
        ;;
esac | grep -i $ampm

