#!/usr/bin/env python
import os
hostname = "sebas87.no-ip.org" #example
#response = os.system("ping -c 1 " + hostname)
response = os.system("ping -c 1 -w2 " + hostname + " > /dev/null 2>&1")
if response == 0:
    print(hostname, 'is up!')
else:
    print(hostname, 'is down!')
