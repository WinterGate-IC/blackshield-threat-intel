# BLACKSHIELD - Enterprise Threat Intelligence Database

Automated collection of malicious infrastructure from 233+ threat feeds

## Database Statistics

| Category | Count |
|----------|-------|
| Malicious IPs | 276,462 |
| CIDR Ranges | 11,306 |
| Malicious ASNs | 4,530 |
| Total Entries | 292,325 |
| Blocklist Size | 4.0 MB |
| Threat Feeds | 233+ |

## Repository Structure

- ips/ - Individual malicious IPs (276K)
- asns/ - Malicious ASNs (4.5K)
- cidrs/ - CIDR range blocks (11K)
- blocklists/ - Ready-to-deploy ipset/iptables
- country/ - Country-specific blocks (CN, RU, IR, KP, CU, SY, VN)
- db/ - Compressed database and JSON exports
- feeds/ - Source metadata
- sources/ - Feed URLs and categories

## Quick Deploy

### ipset (recommended)

ipset create blackshield hash:net
ipset restore < blocklists/ipset_blacklist.txt
iptables -I INPUT -m set --match-set blackshield src -j DROP

### iptables direct

while read ip; do iptables -A INPUT -s $ip -j DROP; done < ips/malicious_ips.txt

### Country blocking

while read cidr; do iptables -A INPUT -s $cidr -j DROP; done < country/CN_cidrs.txt

## Raw File URLs

Complete Blocklist:
https://raw.githubusercontent.com/wintergate-ic/blackshield-threat-intel/main/blocklists/complete_blocklist.txt

Malicious IPs:
https://raw.githubusercontent.com/wintergate-ic/blackshield-threat-intel/main/ips/malicious_ips.txt

Malicious ASNs:
https://raw.githubusercontent.com/wintergate-ic/blackshield-threat-intel/main/asns/malicious_asns.txt

CIDR Ranges:
https://raw.githubusercontent.com/wintergate-ic/blackshield-threat-intel/main/cidrs/malicious_cidrs.txt

Country Blocks:
https://raw.githubusercontent.com/wintergate-ic/blackshield-threat-intel/main/country/CN_cidrs.txt
https://raw.githubusercontent.com/wintergate-ic/blackshield-threat-intel/main/country/RU_cidrs.txt
https://raw.githubusercontent.com/wintergate-ic/blackshield-threat-intel/main/country/IR_cidrs.txt
https://raw.githubusercontent.com/wintergate-ic/blackshield-threat-intel/main/country/KP_cidrs.txt

## Sources

Data aggregated from 233+ threat feeds including:
- Spamhaus DROP/EDROP/ASNDROP
- Feodo Tracker
- AlienVault OTX
- Blocklist.de
- DShield
- Emerging Threats
- FireHOL IPSets
- Tor Exit Nodes
- Cybercrime Tracker
- ThreatFox
- SSL Blacklist
- Zeus/SpyEye/Palevo Trackers
- Ransomware Tracker
- AbuseIPDB
- URLhaus
- MalwareDomains
- Phishing Army
- ipdeny.com

## License

Free for security research and defensive use.


