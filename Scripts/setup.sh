#!/usr/bin/env bash
# get dir root from user, this should be the name of the company
read -p "[*] Enter name: " name
name="../${name}" # add prefix
#set up sub-dirs and array
domains="${name}/Domains"
done="${domains}/Done"
split="${domains}/Split"
nmap="${domains}/Nmap"
sublister="${domains}/Sublist3r"
extension="${name}/Extensions"
retire="${extension}/Retire"
note="${name}/Notes"
scriptDir="${name}/Scripts"
declare -a dirs=(
$name $domains $done $split
$nmap $sublister $extension
$retire $note $scriptDir
	        )

# iteratre through array
echo "[*] Making directory tree"
for dir in "${dirs[@]}"
do
	mkdir $dir
done

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
