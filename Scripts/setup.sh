#!/usr/bin/env bash
# get dir root from user, this should be the name of the company
read -p "[*] Enter name: " name
dirName="../${name}" # add prefix
#set up sub-dirs and array
domains="${dirName}/Domains"
done="${domains}/Done"
split="${domains}/Split"
nmap="${domains}/Nmap"
sublister="${domains}/Sublist3r"
extension="${dirName}/Extensions"
retire="${extension}/Retire"
note="${dirName}/Notes"
scriptDir="${dirName}/Scripts"
declare -a dirs=(
$dirName $domains $done $split
$nmap $sublister $extension
$retire $note $scriptDir
	        )

# iteratre through array
echo "[*] Making directory tree"
for dir in "${dirs[@]}"
do
	mkdir $dir
done

#add valid domain list for bounty
echo "[*] Writing domain.txt"
domainTxt="${domains}/domains.txt"
touch $domainTxt
echo "List of Domains for ${name}" >> $domainTxt
echo " " >> $domainTxt
echo "1. " >> $domainTxt

# copy scripts over
echo "[*] Making scripts"
nmap="nmap.sh"
declare -a scripts=(
$nmap
		   )
for script in "${scripts[@]}"
do
	cp $script $scriptDir
done
echo "[*] Done!"
