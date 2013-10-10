#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import platform
import urllib.request
if platform.python_version() < "3.0.0": 
    print("ERROR: Python 3.0 or greater is required for this to run. Sorry")
    sys.exit()

url = "http://www.strona.com/"
request=urllib.request.Request(url)
response=urllib.request.urlopen(request)
print(response.read())
