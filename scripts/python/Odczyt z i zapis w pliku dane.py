#!/usr/bin/env python
# -*- coding: utf-8 -*-
print('Odczytywanie zawartości pliku "dane"')
f = open('dane')
bytes = f.read()
print(bytes)
print('Dodawanie nowych danych (w nowej linii) do pliku')
filename = ('dane');
with open ('dane', "a") as f:
  f.write (input ());
  f.write("\n")
