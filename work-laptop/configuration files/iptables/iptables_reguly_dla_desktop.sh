#!/bin/sh
# stała ścieżka iptables
# f="/usr/sbin/iptables"
# f="/sbin/iptables"
f="iptables"
echo "Dodaje Reguły dla IPtables"

echo "Czyszczenie starych reguł"
# CZYSZCZENIE STARYCH REGUŁ
$f -F
$f -X
$f -F -t nat
$f -X -t nat
$f -F -t filter
$f -X -t filter

echo "Ustawienie polityki działania"
# USTAWIENIE POLITYKI DZIAŁANIA
$f -P INPUT DROP
$f -P FORWARD DROP
$f -P OUTPUT DROP
# $f -P OUTPUT ACCEPT
# $f -A OUTPUT -m state -p icmp --state INVALID -j DROP
# $f -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# zezwolenie na inicjowanie połączeń przy polityce DROP dla łańcucha OUTPUT bez wyszczególniania reguł
# $f -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

echo "Dopuszczenie localhostu"
# Odblokowanie / Dopuszczenie localhostu
$f -A INPUT -i lo -j ACCEPT
$f -A FORWARD -o lo -j ACCEPT
$f -A OUTPUT -o lo -j ACCEPT

echo "Nawiązanie połączenia"
# NAWIĄZANIE POŁĄCZENIA
$f -A INPUT -j ACCEPT -m state --state ESTABLISHED,RELATED
$f -A FORWARD -j ACCEPT -m state --state ESTABLISHED,RELATED

echo "Dodanie regułek"
## Regułki
echo "Reguła FTP"
# FTP
# FTP tryb aktywny
$f -A OUTPUT -p tcp --dport 20:21 -j ACCEPT
$f -A OUTPUT -p tcp --dport 20:21 -j ACCEPT

# FTP tryb pasywny
$f -A OUTPUT -p tcp --dport 1024:65535 -j ACCEPT
$f -A OUTPUT -p tcp --dport 1024:65535 -j ACCEPT

echo "Reguła SSH"
# SSH
$f -A OUTPUT -p tcp --dport 22 -j ACCEPT
$f -A OUTPUT -p tcp --dport 10025 -j ACCEPT

echo "Regula DNS"
# DNS
$f -A OUTPUT -p udp --dport 53 -j ACCEPT
# $f -A INPUT -p udp --sport 53 -j ACCEPT

echo "Reguła WWW"
# WWW
$f -A OUTPUT -p tcp --dport 80 -j ACCEPT
$f -A OUTPUT -p tcp --dport 443 -j ACCEPT

echo "Reguła Poczta"
# Wybrać tylko jedną opcję
# Poczta tylko imap + stmp
# $f -A OUTPUT -p tcp --dport 143 -j ACCEPT
# $f -A OUTPUT -p tcp --dport 587 -j ACCEPT
# Poczta tylko imap + smtp dla SSL
# $f -A OUTPUT -p tcp --dport 993 -j ACCEPT
# $f -A OUTPUT -p tcp --dport 465 -j ACCEPT
# Poczta tylko pop + smtp
$f -A OUTPUT -p tcp --dport 110 -j ACCEPT
$f -A OUTPUT -p tcp --dport 587 -j ACCEPT
# Poczta tylko pop + smtp dla SSL
# $f -A OUTPUT -p tcp --dport 995 -j ACCEPT
# $f -A OUTPUT -p tcp --dport 465 -j ACCEPT

echo "Reguła Samba"
# Samba
$f -A OUTPUT -p tcp --dport 137 -j ACCEPT
$f -A OUTPUT -p tcp --dport 138 -j ACCEPT
$f -A OUTPUT -p tcp --dport 139 -j ACCEPT
$f -A OUTPUT -p tcp --dport 445 -j ACCEPT

# echo "VNC"
# VNC
# $f -A OUTPUT -p tcp --dport 5901 -j ACCEPT
# $f -A OUTPUT -p udp --dport 5901 -j ACCEPT

echo "WhoIs"
# whois
$f -A OUTPUT -p tcp --dport 43 -j ACCEPT
$f -A OUTPUT -p tcp --dport 43 -j ACCEPT

echo "Dopuszczenie PING"
# PING (dopuszczenie)
# $f -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
$f -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT

# PING (zablokowanie)
$f -A INPUT -p icmp --icmp-type echo-request -j REJECT --reject-with icmp-host-unreachable

echo "Blokowanie Telnetu"
# Blokowanie Telnetu
$f -A OUTPUT -p tcp --dport telnet -j REJECT
$f -A INPUT -p tcp --dport telnet -j REJECT

echo "Ochrona przed skanowaniem"
# Ochrona przed skanowaniem

echo "Ochrona przez skanowaniem SYN"
# nmap -sS /skanowanie portów
$f -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH SYN -j LOG --log-prefix "Wykryto skanowanie typu SYN-FLOOD: "
$f -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH SYN -j DROP

echo "Ochrona przez skanowaniem ACK"
# nmap -sA /filtr pakietów (ACK)
$f -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH ACK -j LOG --log-prefix "Wykryto skanowanie typu ACK: "
$f -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH ACK -j DROP # Metoda ACK (nmap -sA)

echo "Ochrona przez skanowaniem FIN"
# nmap -sF (Fin)
$f -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH FIN -j LOG --log-prefix "Wykryto skanowanie typu FIN: "
$f -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH FIN -j DROP # Skanowanie FIN (nmap -sF)

echo "Ochrona przez skanowaniem XMAS"
# nmap -sX / Xmas Tree
$f -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH PSH -j LOG --log-prefix "Wykryto skanowanie typu XMAS: "
$f -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH FIN,URG,PSH -j DROP # Metoda Xmas Tree (nmap -sX)

echo "Ochrona przez skanowaniem NULL"
# nmap -sN / Null scan
$f -A INPUT -m conntrack --ctstate INVALID -p tcp ! --tcp-flags SYN,RST,ACK,FIN,PSH,URG SYN,RST,ACK,FIN,PSH,URG -j LOG --log-prefix "Wykryto skanowanie typu NULL: "
$f -A INPUT -m conntrack --ctstate INVALID -p tcp ! --tcp-flags SYN,RST,ACK,FIN,PSH,URG SYN,RST,ACK,FIN,PSH,URG -j DROP # Skanowanie Null (nmap -sN)

echo "Ochrona przez atakami"
# Ochrona przed atakami

echo "Ochrona przed atakiem PING OF DEATH"
# Ping of death
$f -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j LOG --log-prefix "Wykryto atak typu PING OF DEATH: "
$f -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT # Ping of death
# Zablokowanie Pingowania
# $f -A INPUT -p icmp --icmp-type echo-request -j REJECT --reject-with icmp-host-unreachable

echo "Ochrona przed atakiem DOS"
# Łańcuch syn-flood (obrona przed DoS)
$f -N syn-flood
$f -A INPUT -p tcp --syn -j syn-flood
$f -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN
$f -A syn-flood -m limit --limit 1/s --limit-burst 4 -j LOG --log-prefix "Wykryto atak typu DoS: "
$f -A syn-flood -j DROP

echo "Ochrona przed atakiem SYN-FLOOD"
# Syn-flood protection
$f -A INPUT -p tcp --syn -m limit --limit 1/s -j ACCEPT

echo "Ochrona przed atakiem FURTIVE PORT SCANNER"
# Furtive port scanner
$f -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s -j ACCEPT

echo "Blokowanie wybranych stron"
# Blokowanie www
#$f -A OUTPUT -p tcp -m string --string "onet.pl" --algo kmp -j DROP

echo "Reguły dla IPtables zostały załadowane"
