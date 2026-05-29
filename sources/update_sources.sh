#!/bin/bash
# BLACKSHIELD - Update sources from GitHub
# Run this to refresh feed lists

wget -q -O /opt/blackshield/feeds/master_feeds.txt https://raw.githubusercontent.com/WinterGate-IC/blackshield-threat-intel/main/sources/feed_urls.txt
echo "[*] Sources updated from GitHub repository"
