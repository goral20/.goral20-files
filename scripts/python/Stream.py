#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import platform
import subprocess
if platform.python_version() < "3.0.0": 
    print("UWAGA. Do działania skryptu wymagany jest Python w wersji 3.x !!!")
    sys.exit()

# Skrypt umożliwiający oglądanie streamów z Gamcreads oraz Twich
# Program w wersji v1.03
# Autor: goral20
# https://github.com/goral20
print("")
print("Wybierz streamera/platformę")
print("1. Wonziu Gamecreads")
print("2. Wonziu Twitch")
print("3. Wonziu HitBox")
print("4. Hayuto")
platforma = input("Wybieram: ")
if platforma == '1':
    # print("gamecreads")
    platforma = 'http://www.dailymotion.com/embed/video/xzlc83'
elif platforma == '2':
    # print("twitch")
    platforma = 'http://www.twitch.tv/wonziu'
elif platforma == '3':
    platforma = 'http://hitbox.tv/#!/embed/vonzay'
elif platforma == '4':
    platforma = 'rtmp://37.59.202.234:13335/live/hayuto'
    subprocess.call(["mpv", "rtmp://37.59.202.234:13335/live/hayuto"])
# print(platforma)

print("")
print("Wybierz jakośc")
print("1. 240p")
print("2. 380p")
print("3. 480p")
print("4. 720p")
print("5. bez wyboru jakości")
jakosc = input("Wybieram: ")
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
elif jakosc == '5':
    # print("720p")
    jakosc = ''
else:
    print("QUIT")
# print(jakosc)

# ilośc powtórzeń
print("")
n = int(input('Podaj ilość prób: '))
for i in range(n):
    subprocess.call(["livestreamer", "-p", "mpv", platforma, jakosc])
