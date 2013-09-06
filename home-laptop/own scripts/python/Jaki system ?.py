#!/usr/bin/env python
# wersja v1.0.2
import sys
import platform
import socket
print('Korzystam z systemu: ' + sys.platform)
print('Posiadam jądro w wersji: ' + platform.release())
print('Mój hostname to: ' + socket.gethostname())
