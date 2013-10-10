#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import platform
if platform.python_version() < "3.0.0": 
    print("ERROR: Python 3.0 or greater is required for this to run. Sorry")
    sys.exit()

from urllib.request import urlopen

html = urlopen("http://www.google.com/")
print(html.read())
