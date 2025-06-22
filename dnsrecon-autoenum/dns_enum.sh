#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

domain=$1
timestamp=$(date +%Y%m%d-%H%M%S)
result_file="results/dnsrecon_result_${domain}_$timestamp.txt"
echo "[+] Enumerating DNS info for: $domain"
echo "[*] Output will be saved to: $result_file"
echo

mkdir -p results
> "$result_file"

echo "[*] Gathering basic DNS records..."
dnsrecon -d $domain -t std >> "$result_file"

echo "[*] Trying Zone Transfer..."
dnsrecon -d $domain -t axfr >> "$result_file"

echo "[*] Bruteforcing Subdomains (top 1000)..."
dnsrecon -d $domain -D wordlists/dnsmap.txt -t brt >> "$result_file"

echo "[*] Looking for SRV Records..."
dnsrecon -d $domain -t srv >> "$result_file"

echo "[*] Checking TXT/SPF Records..."
dnsrecon -d $domain -t txt >> "$result_file"

echo
echo "[+] DNS Enumeration Completed."
echo

echo "==========================" >> "$result_file"
echo "🔍 تحليل النتائج" >> "$result_file"
echo "==========================" >> "$result_file"

echo -e "\n[+] Zone Transfer Analysis:" >> "$result_file"
if grep -q "AXFR Record" "$result_file"; then
    echo "[!!] 🚨 Zone Transfer was successful! Internal records exposed." >> "$result_file"
else
    echo "[OK] Zone Transfer attempt failed or blocked (secure)." >> "$result_file"
fi

echo -e "\n[+] Subdomain Discovery:" >> "$result_file"
grep "Name:" "$result_file" | grep -v "@" | awk '{print $2}' | sort -u >> "$result_file"

echo -e "\n[+] Mail Servers (MX Records):" >> "$result_file"
grep "MX Record" "$result_file" | awk '{print $NF}' | sort -u >> "$result_file"

echo -e "\n[+] TXT/SPF Records:" >> "$result_file"
grep "TXT Record" "$result_file" >> "$result_file"

echo -e "\n[+] Services (SRV Records):" >> "$result_file"
grep "SRV Record" "$result_file" >> "$result_file"

echo "[+] Done. تحليل كامل موجود في: $result_file"
