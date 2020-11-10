#!/bin/bash

mkdir $1; cd $1
touch all.txt
touch alive.txt

echo "Target domain: $1"

echo "[*] Starting amass scan..."
amass enum -d $1 -o amass.out
echo "[+] Amass scan done."
echo "[*] Starting sublist3r scan..."
sublist3r -d $1 -o sublist3r.out
echo "[+] sublist3r scan done."
echo "[*] Starting subfinder scan..."
subfinder -d $1 -o subfinder.out
echo "[+] subfinder scan done."
echo "[*] Starting assetfinder scan..."
assetfinder --subs-only $1 | tee assetfinder.out
echo "[+] assetfinder scan done."

echo "[*] Checking cloud ranges..."
dnsbuffer $1 | tee dnsbuffer.out
echo "[+] Done."
echo "[*] Joining results and removing duplicates..."
cat *.out > all.txt
sort -u -o all.txt all.txt
rm *.out

echo "[*] Running httprobe..."
cat all.txt | httprobe | tee alive.txt
echo "[+] Done"

echo "[*] Domains saved into all.txt"
echo "[*] Live hosts saved into alive.txt"


##############################################
# to append results to my custom dns wordlist#
##############################################

cat all.txt | tr '.' '\n' | sort -u >> /opt/custom-wordlists/silvestre-all.txt
sort -u -o /opt/custom-wordlists/silvestre-all.txt /opt/custom-wordlists/silvestre-all.txt


cd ..
