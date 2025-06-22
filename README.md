# dns_enum
```
dnsrecon-autoenum/
├── dns_enum.sh             ← السكريبت الأساسي
├── wordlists/              ← مجلد اختياري لقوائم brute force
│   └── dnsmap.txt
├── results/                ← لحفظ نواتج الفحص
├── LICENSE
└── README.md               ← التوثيق الكامل
```

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

chmod +x dns_enum.sh
./dns_enum.sh example.com

## 📁 Output Example

results/dnsrecon_result_example.com.txt

Subdomains discovered

MX records

SPF/TXT info

Zone transfer success/failure

SRV services


## 📂 Wordlists
A sample DNS wordlist is provided under wordlists/dnsmap.txt. You can replace or update it with:

/usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt
## 🔒 Legal Disclaimer
This tool is intended for authorized security testing and educational purposes only. Do not use it on domains without proper authorization.

## 👨‍💻 Author
Kareem Khaled 


Copyright (c) 2025 Kareem Khaled

Permission is hereby granted, free of charge, to any person obtaining a copy...

