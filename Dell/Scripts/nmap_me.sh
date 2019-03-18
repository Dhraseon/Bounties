#!/bin/bash
# split the domain files into groups of 50
FILES="../Domains/Sublist3r/*"
for f in $FILES
do
	name=${f##*/}
	echo "Splitting ${name}"
	split -l 50 $f ../Domains/Split/
done
# Nmap each file created by the split
FILES="../Domains/Split/*"
for f in $FILES
do
	name=${f##*/}
	echo $name
	nmap -iL $f -oG "./../Domains/Nmap/${name}_nmap.txt"
done
