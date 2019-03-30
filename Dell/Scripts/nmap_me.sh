#!/bin/bash
# split the domain files into groups of 50
# iff the split dir doesn't exist already
FILES="../Domains/Sublist3r/*"
if [ ! -d "../Domains/Split" ]; then
	mkdir "../Domains/Split"
	for f in $FILES
	do
		name=${f##*/}
		echo "[*] Splitting ${name}"
		split -l 50 $f ../Domains/Split/
	done
fi
# Nmap each file created by the split
if [ ! -d "../Domains/Done" ]; then
	mkdir "../Domains/Done/"
fi
FILES="../Domains/Split/*"
for f in $FILES
do
	name=${f##*/}
	echo "[*] Nmapping: ${name}"
	nmap -iL $f -oG "./../Domains/Nmap/${name}_nmap.txt"
	echo "[*] Nmap done, moving file ${name} to ../Domains/Done/" 
	mv $f "../Domains/Done/${name}"
done
