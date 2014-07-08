# Skrypt umożliwiający oglądanie streamów z Gamcreads oraz Twich
# Program w wersji v1.50
# Autor: goral20
# https://github.com/goral20

#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import platform
import subprocess
if platform.python_version() < "3.0.0": 
    print("UWAGA. Do działania skryptu wymagany jest Python w wersji 3.x !!!")
    sys.exit()

print("")
print("Wybierz streamera/platformę")
print("1. Wonziu DailyMotion")
print("2. Wonziu Twitch")
print("3. Wonziu Twitch")
print("4. Wonziu HitBox")
print("5. Hayuto")
platforma = input("Wybieram: ")
if platforma == '1':
    # print("dailymotion")
    platforma = 'http://www.dailymotion.com/embed/video/x1b1nt1'
elif platforma == '2':
    # print("twitch")
    platforma = 'http://www.twitch.tv/wonziu'
elif platforma == '3':
    # print("twitch")
    platforma = 'http://www.twitch.tv/wonziu'
elif platforma == '4':
    platforma = 'http://hitbox.tv/#!/embed/vonzay'
elif platforma == '5':
    platforma = 'rtmp://37.59.202.234:13335/live/hayuto'
    subprocess.call(["mpv", "rtmp://37.59.202.234:13335/live/hayuto"])
# print(platforma)

print("")
print("Wybierz jakośc")
print("1. 240p")
print("2. 380p")
print("3. 480p")
print("4. 720p")
print("5. 1080p")
print("6. bez wyboru jakości")
jakosc = input("Wybieram: ")
if jakosc == '1':
    jakosc = '240p'
elif jakosc == '2':
    jakosc = '380p'
elif jakosc == '3':
    jakosc = '480p'
elif jakosc == '4':
    jakosc = '720p'
elif jakosc == '5':
    jakosc = '1080p'
elif jakosc == '6':
    jakosc = ''
else:
    print("QUIT")
# print(jakosc)

# ilośc powtórzeń
print("")
n = int(input('Podaj ilość prób: '))
for i in range(n):
    subprocess.call(["livestreamer", "-p", "mpv", platforma, jakosc])
