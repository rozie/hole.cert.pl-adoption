# hole.cert.pl-adoption
Data about adoption of hole.cert.pl among Polish ISP


Description
---------
The aim of this project is to gather data about adoption of hole.cert.pl anti phishing
DNS protection (read more: https://www.cert.pl/ostrzezenia_phishing/) among Polish ISP.

It provides both data and tools to gather or verify them.

Known phishing domain listed on hole.cert.pl is checked on Google DNS servers,
where it is not blocked. Then the answer is compared against given DNS servers.
If response differ, seems that ISP is altering DNS requests, probably using
data from hole.cert.pl


Requirements
---------
- Bash
- *host* command (comes in bind9-host package in Debian)
- curl, sort, tail, awk commands available


Usage
---------
- Run ./hole_cert_check.sh server [server2] for the server you want to check.


Files
---------
- hole_cert_check.sh - script to automate checks
- results.log - raw data from scripts output
- dns_servers - file with information about checked DNS servers, are they open
relays, etc. (TODO, format TBD)
- results.csv - file with information about ISP, DNS, and hole.cert.pl usage (TODO, format TBD)


Contribution
---------
Help is always welcome, so clone this repository, send pull requests or create
issues if you find any bugs.
- Append full output to results.log file as a "proof"
- Modify accordingly the rest of the files


Disclaimer
---------
Data from this repository come without any warranty. Especially you cannot rely on them
as an indicator for phishing protection.


License
---------
See LICENSE file
