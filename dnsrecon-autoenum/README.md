# 🔍 DNSRecon AutoEnum

Automated DNS Enumeration script using `dnsrecon` to assist penetration testers in performing fast, structured recon on target domains.

## 📌 Features

- Collects DNS records (A, NS, MX, TXT, SOA)
- Attempts AXFR (Zone Transfer)
- Brute-forces subdomains using wordlist
- Extracts SRV and SPF/TXT records
- Performs basic result analysis and flags key findings
- Saves output to organized result files

## ⚙️ Requirements

- Linux (Kali or Parrot OS recommended)
- `dnsrecon` installed (`apt install dnsrecon`)
- Bash

## 🧪 Usage

```bash
chmod +x dns_enum.sh
./dns_enum.sh example.com
```

## 📂 Wordlists

Sample wordlist in `wordlists/dnsmap.txt` — replace with a larger one if needed.

## 🔒 Legal Disclaimer

This tool is intended for authorized testing only. Don't test without permission.

## 👨‍💻 Author

Kareem Khaled (@K4R33M_1)
