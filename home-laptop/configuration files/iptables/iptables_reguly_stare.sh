#!/bin/sh
echo "Starting firewall"

# CZYSZCZENIE STARYCH REGUŁ
/sbin/iptables -F
/sbin/iptables -X
/sbin/iptables -t nat -X
/sbin/iptables -t nat -F

# ODBLOKOWANIE LOCALHOSTU
/sbin/iptables -A INPUT -i lo -j ACCEPT
/sbin/iptables -A FORWARD -o lo -j ACCEPT

# USTAWIENIE POLITYKI DZIAŁANIA
/sbin/iptables -P INPUT DROP
/sbin/iptables -P FORWARD DROP
/sbin/iptables -P OUTPUT ACCEPT
/sbin/iptables -A OUTPUT -m state -p icmp --state INVALID -j DROP

# NAWIĄZANIE POŁĄCZENIA
/sbin/iptables -A INPUT -j ACCEPT -m state --state ESTABLISHED,RELATED
/sbin/iptables -A FORWARD -j ACCEPT -m state --state ESTABLISHED,RELATED

# WoL
/sbin/iptables -A INPUT -s 0/0 -p tcp --dport 9 -j ACCEPT
/sbin/iptables -A INPUT -s 0/0 -p udp --dport 9 -j ACCEPT


# SSH
/sbin/iptables -A INPUT -s 0/0 -p tcp --dport 10025 -j ACCEPT
/sbin/iptables -A INPUT -s 0/0 -p udp --dport 10025 -j ACCEPT

# APACHE
/sbin/iptables -A INPUT -s 0/0 -p tcp --dport 80 -j ACCEPT
/sbin/iptables -A INPUT -s 0/0 -p udp --dport 80 -j ACCEPT
/sbin/iptables -A INPUT -s 0/0 -p tcp --dport 443 -j ACCEPT
/sbin/iptables -A INPUT -s 0/0 -p tcp --dport 443 -j ACCEPT

# RTORRENT
/sbin/iptables -A INPUT -s 0/0 -p tcp --dport 53211 -j ACCEPT
/sbin/iptables -A INPUT -s 0/0 -p udp --dport 53211 -j ACCEPT

# FTP TRYB AKTYWNY
/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.4 -p tcp --dport 20:21 -j ACCEPT
/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.4 -p udp --dport 20:21 -j ACCEPT
#/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.4 -p tcp --dport 21 -j ACCEPT
#/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.4 -p tcp --dport 21 -j ACCEPT

# FTP TRYB PASYWNY
/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.4 -p tcp --dport 1024:1025 -j ACCEPT
/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.4 -p udp --dport 1024:1025 -j ACCEPT
#/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.4 -p tcp --dport 1025 -j ACCEPT
#/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.4 -p udp --dport 1025 -j ACCEPT

# SAMBA
/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.9 -p udp --dport 137 -j ACCEPT
/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.9 -p udp --dport 138 -j ACCEPT
/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.9 -p tcp --dport 139 -j ACCEPT
/sbin/iptables -A INPUT -m iprange --src-range 192.168.1.2-192.168.1.9 -p tcp --dport 445 -j ACCEPT

# DLNA
# odblokowanie broadcast-u uPnP

/sbin/iptables -A OUTPUT -o eth0 -d 239.255.255.250 -j ACCEPT

/sbin/iptables -A OUTPUT -o eth0 -s 239.255.255.250 -j ACCEPT

/sbin/iptables -A INPUT -i eth0 -d 239.255.255.250 -j ACCEPT

/sbin/iptables -A INPUT -i eth0 -s 239.255.255.250 -j ACCEPT

 
# odblokowanie serwera miniDLNA

/sbin/iptables -A OUTPUT -o eth0 -p tcp --sport 8200 -j ACCEPT

/sbin/iptables -A INPUT -i eth0 -p tcp --dport 8200 -j ACCEPT

 
# odblokowanie uPnP

/sbin/iptables -A INPUT -i eth0 -p udp --dport 1900 -j ACCEPT

/sbin/iptables -A OUTPUT -o eth0 -p udp --sport 1900 -j ACCEPT

# end miniDLNA

#PING
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT

# ochrona przed atakiem typu Smurf
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

# nie akceptujemy pakietow "source route" (zmieniaja tablice routingu)
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route

# nie przyjmujemy pakietow ICMP redirect, ktore moga zmienic nasza tablice routingu
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects

# wlaczamy ochrone przed blednymi pakietami ICMP error
echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

# ochrona przed spoofingiem -kazdy interfejs sieciowy bedzie przyjmowal
# tylko te pakiety ktore znajduja sie w tablicy routingu
echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter

# wlacza logowanie dziwnych (spoofed, source routed, redirects) pakietow
#echo 1 > /proc/sys/net/ipv4/conf/all/log_martians

#Blokada przed atakami typu SYN FLOODING
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

echo "Reguły dla IPtables zostały załadowane"
