#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import platform
import subprocess
if platform.python_version() < "3.0.0": 
    print("UWAGA. Do działania skryptu wymagany jest Python w wersji 3.x !!!")
    sys.exit()

# Skrypt umożliwiający oglądanie streamów z Gamcreads oraz Twich
# Program w wersji v1.01
# Autor: goral20
# https://github.com/goral20
print("")
print("Wybierz platformę")
print("1. Gamecreads")
print("2. Twitch")
print("3. HitBox")
platforma = input("Wybieram: ")
if platforma == '1':
    # print("gamecreads")
    platforma = 'http://www.dailymotion.com/embed/video/xzlc83'
elif platforma == '2':
    # print("twitch")
    platforma = 'http://www.twitch.tv/wonziu'
elif platforma == '3':
    platforma = 'http://hitbox.tv/#!/embed/vonzay'
else:
    print("syf")
    platforma = 'syf'
# print(platforma)

print("")
print("Wybierz jakośc")
print("1. 240p")
print("2. 380p")
print("3. 480p")
print("4. 720p")
jakosc = input("Wubieram: ")
if jakosc == '1':
    # print("240p")
    jakosc = '240p'
elif jakosc == '2':
    # print("380p")
    jakosc = '380p'
elif jakosc == '3':
    # print("480p")
    jakosc = '480p'
elif jakosc == '4':
    # print("720p")
    jakosc = '720p'
else:
    print("QUIT")
# print(jakosc)

print("")
subprocess.call(["livestreamer", "-p", "mpv", platforma, jakosc])
