#!/usr/bin/env python

import os
import time
from subprocess import Popen

devnull = open(os.devnull, 'wb')

print("Goral20 IP Range Scanner v0.1")
print("... type enter to continue ")
input()
str1=input("Enter the ip range ( ex: 192.168.0 ) ")

print("scanning ip range ",str1)
print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=")

if str1 == "":
 print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-")
 print("please type your ip range and try again...")
 print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=")
 import sys
 sys.exit()


p = [] # ip -> process
act = 0
nrp = 0
err = 0

for n in range(1,255): # start ping processes
    ip = str1+".%d" % n
    p.append((ip, Popen(['ping', '-c', '3', ip], stdout=devnull)))
while p:
    for i, (ip, proc) in enumerate(p[:]):
        if proc.poll() is not None: # ping finished
            p.remove((ip, proc)) # this makes it O(n**2)
            if proc.returncode == 0:
                print('%s active' % ip)
                act = act + 1
            elif proc.returncode == 2:
                print('%s no response' % ip)
                nrp=nrp+1
            else:
                print('%s error' % ip)
                err=err+1
    time.sleep(.04)
devnull.close()

print("")
print("IP Range Scanner, powered by goral20")
print("")
import os
print("Current SO",os.name)
print("Network status")
print("Active ips [ ",act," ]")
print("Error ips [ ",err," ]")
print("No response [ ",nrp," ]")
print("")
print("Good bye!")
