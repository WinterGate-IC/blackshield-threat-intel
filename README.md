# BLACKSHIELD - Enterprise Threat Intelligence Database

Automated collection of malicious infrastructure from 233+ threat feeds.

**BLACKSHIELD**: 
> ``is a public repository of curated threat intelligence resources built for defenders who need actionable, well-organized data to protect their networks without relying on commercial vendors or proprietary platforms. The repository contains 276,462 individual malicious IP addresses, 11,306 hostile CIDR ranges, and 4,530 malicious Autonomous System Numbers, all aggregated from over 233 publicly available threat feeds including Spamhaus, Feodo Tracker, AlienVault OTX, Blocklist.de, DShield, Emerging Threats, FireHOL, Tor exit node lists, ThreatFox, SSL Blacklist, Zeus Tracker, SpyEye Tracker, Palevo Tracker, Ransomware Tracker, AbuseIPDB, URLhaus, MalwareDomains, Phishing Army, ipdeny.com, and numerous other community-driven intelligence sources. The repository also includes country-specific IP blocks for China, Russia, Iran, North Korea, Cuba, Syria, and Vietnam, derived from authoritative RIR delegation data and ipdeny aggregated zones. Every file in the repository is formatted for immediate use with standard security tools including ipset for high-performance kernel-level blocking, iptables and nftables for firewall rules, and BGP routing filters for network-level null routing. The data is organized into clear, logical folders separating individual IPs, CIDR ranges, ASNs, ready-to-deploy blocklists, and country-specific blocks, making it easy to integrate into existing security workflows regardless of whether you are running a small homelab, a corporate firewall, a cloud infrastructure, or a large ISP network. The purpose of BLACKSHIELD is simple: provide security teams, threat hunters, SOC analysts, penetration testers, infrastructure operators, and independent researchers with free, accessible, well-documented, and structured threat intelligence that can be deployed immediately without commercial tools, without API keys, without subscription fees, and without vendor lock-in. No paywalls. No registration. No hidden costs. Just data that works.``

Repository: https://github.com/wintergate-ic/blackshield-threat-intel

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


