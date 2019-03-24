#!/bin/bash
# split the domain files into groups of 50
FILES="../Domains/Sublist3r/*"
mkdir "../Domains/Split"
for f in $FILES
do
	name=${f##*/}
	echo "[*] Splitting ${name}"
	split -l 50 $f ../Domains/Split/
done
# Nmap each file created by the split
mkdir "../Domains/Done/"
FILES="../Domains/Split/*"
for f in $FILES
do
	name=${f##*/}
	echo "[*] Nmapping: ${name}"
	nmap -iL $f -oG "./../Domains/Nmap/${name}_nmap.txt"
	echo "[*] Nmap done, moving file ${name} to ../Domains/Split/" 
	mv $f "../Domains/Split/${name}"
done
