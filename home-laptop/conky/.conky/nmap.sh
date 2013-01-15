#!/bin/bash
# nmap -sP -oG /tmp/nmap.out 192.168.1.1/24 >> /dev/null && grep Up /tmp/nmap.out
#nmap -sP -oG /tmp/nmap.out 192.168.1.1/24 | grep Up /tmp/nmap.outn
nmap -sP -oG /tmp/nmap.out 192.168.1.1/24 && grep Up /tmp/nmap.out
