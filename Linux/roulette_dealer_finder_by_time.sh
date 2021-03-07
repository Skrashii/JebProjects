#!/bin/bash

date=$1
time=$2
ampm=$3

cat *$date* | grep $time | awk '{print $1, $2, $5, $6}' | grep -i $ampm


