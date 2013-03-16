#!/bin/sh

# CZYSZCZENIE STARYCH REGUŁ
iptables -F
iptables -X
iptables -F -t nat
iptables -X -t nat
iptables -F -t filter
iptables -X -t filter

# USTAWIENIE POLITYKI DZIAŁANIA
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
iptables -A OUTPUT -m state -p icmp --state INVALID -j DROP

# Odblokowanie / Dopuszczenie localhostu
iptables -A INPUT -i lo -j ACCEPT
iptables -A FORWARD -o lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT


# NAWIĄZANIE POŁĄCZENIA
iptables -A INPUT -j ACCEPT -m state --state ESTABLISHED,RELATED
iptables -A FORWARD -j ACCEPT -m state --state ESTABLISHED,RELATED

# SSH
#/sbin/iptables -A INPUT -s 0/0 -p tcp --dport 10025 -j ACCEPT
#/sbin/iptables -A INPUT -s 0/0 -p udp --dport 10025 -j ACCEPT

# FTP TRYB AKTYWNY
#/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.4 -p tcp --dport 20:21 -j ACCEPT
#/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.4 -p udp --dport 20:21 -j ACCEPT
#/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.4 -p tcp --dport 21 -j ACCEPT
#/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.4 -p tcp --dport 21 -j ACCEPT

# FTP TRYB PASYWNY
#/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.4 -p tcp --dport 1024:1025 -j ACCEPT
#/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.4 -p udp --dport 1024:1025 -j ACCEPT
##/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.4 -p tcp --dport 1025 -j ACCEPT
##/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.4 -p udp --dport 1025 -j ACCEPT

# SAMBA
#/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.9 -p udp --dport 137 -j ACCEPT
#/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.9 -p udp --dport 138 -j ACCEPT
#/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.9 -p tcp --dport 139 -j ACCEPT
#/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.9 -p tcp --dport 445 -j ACCEPT

# odblokowanie uPnP
#/sbin/iptables -A INPUT -i eth0 -p udp --dport 1900 -j ACCEPT
#/sbin/iptables -A OUTPUT -o eth0 -p udp --sport 1900 -j ACCEPT

#PING
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT

# Blokowanie Telnetu
iptables -A OUTPUT -p tcp --dport telnet -j REJECT
iptables -A INPUT -p tcp --dport telnet -j REJECT

# ochrona przed atakiem typu Smurf (stare)
# echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

# nie akceptujemy pakietow "source route" (zmieniaja tablice routingu) (stare)
# echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route

# nie przyjmujemy pakietow ICMP redirect, ktore moga zmienic nasza tablice routingu (stare)
# echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects

# wlaczamy ochrone przed blednymi pakietami ICMP error (stare)
# echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

# ochrona przed spoofingiem -kazdy interfejs sieciowy bedzie przyjmowal (stare)
# tylko te pakiety ktore znajduja sie w tablicy routingu
# echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter

# wlacza logowanie dziwnych (spoofed, source routed, redirects) pakietow (stare)
# echo 1 > /proc/sys/net/ipv4/conf/all/log_martians

# Blokada przed atakami typu SYN FLOODING (stare)
# echo 1 > /proc/sys/net/ipv4/tcp_syncookies

# nmap -sS /skanowanie portów
iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH SYN -j LOG --log-prefix "SKANOWANIE SYN_"
iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH SYN -j DROP

# nmap -sA /filtr pakietów (ACK)
iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH ACK -j LOG --log-prefix "SKANOWANIE FILTR_"
iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH ACK -j DROP

# nmap -sF (Fin)
iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH FIN -j LOG --log-prefix "SKANOWANIE Fin_"
iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH FIN -j DROP

# nmap -sX / Xmas Tree
iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH FIN,URG,PSH -j LOG --log-prefix "SKANOWANIE Xmas_"
iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH FIN,URG,PSH -j DROP

# nmap -sN / Null scan
iptables -A INPUT -m conntrack --ctstate INVALID -p tcp ! --tcp-flags SYN,RST,ACK,FIN,PSH,URG SYN,RST,ACK,FIN,PSH,URG -j LOG --log-prefix "Null scan: "
iptables -A INPUT -m conntrack --ctstate INVALID -p tcp ! --tcp-flags SYN,RST,ACK,FIN,PSH,URG SYN,RST,ACK,FIN,PSH,URG -j DROP # Skanowanie Null (nmap -sN)

# ochrona przed atakami
# Ping of death
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j LOG --log-prefix "Ping: "
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT # Ping of death
# Zablokowanie Pingowania
# iptables -A INPUT -p icmp --icmp-type echo-request -j REJECT --reject-with icmp-host-unreachable

# Łańcuch syn-flood (obrona przed DoS)
iptables -N syn-flood
iptables -A INPUT -p tcp --syn -j syn-flood
iptables -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN
iptables -A syn-flood -m limit --limit 1/s --limit-burst 4 -j LOG --log-prefix "SYN-flood: "
iptables -A syn-flood -j DROP

# Syn-flood protection
iptables -A INPUT -p tcp --syn -m limit --limit 1/s -j ACCEPT

# Furtive port scanner
iptables -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s -j ACCEPT

# SYN flood protection
echo "1" > /proc/sys/net/ipv4/tcp_syncookies

# Wyłączamy odpowiedzi na pingi
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_all

# Ochrona przed atakami typu Smurf
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts:

# Włączamy ochronę przed komunikacją ICMP error
echo "1" > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

# Włącza logowanie dźiwnych pakietów (spoofed. source routed. redirects):
echo "0" > /proc/sys/net/ipv4/conf/all/log_martians

# Nie akceptujemy datagramu IP z opcją “source route”
echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route

# Nie przyjmujemy pakietów ICMP redict, które mogą zmienić naszą tablicę routingu:
echo "0" /proc/sys/net/ipv4/conf/all/accept_redirects

# Wszystkie karty nie bedą przyjmowały pakietów z sieci innych niż te z tablicy routingu
echo "0" /proc/sys/net/ipv4/conf/all/rp_filter

# Blokowanie www
iptables -A OUTPUT -p tcp -m string --string "onet.pl" --algo kmp -j DROP

echo "Reguły dla IPtables zostały załadowane"
