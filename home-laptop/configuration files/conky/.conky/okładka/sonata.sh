#!/bin/bash
sonata info >/home/sebastian/Dokumenty/Conky/okładka/textsonata
if [ -f /home/sebastian/Dokumenty/Conky/okładka/textsonata ]; then
	YEAR=$(cat /home/sebastian/Dokumenty/Conky/okładka/textsonata | grep Data | cut -c 7-)
	ALBUM=$(cat /home/sebastian/Dokumenty/Conky/okładka/textsonata | grep Album | cut -c 8-)
	echo "$ALBUM - $YEAR.jpg" > /home/sebastian/Dokumenty/Conky/okładka/text1
	IMAGE=$(cat /home/sebastian/Dokumenty/Conky/okładka/text1)
	if [ -f "/home/sebastian/Muzyka/.covers/$IMAGE" ]; then
		cp "/home/sebastian/Muzyka/.covers/$IMAGE" "/home/sebastian/Dokumenty/Conky/okładka/currentcover.jpg"
	else
		if [ -f "/home/sebastian/Muzyka/.covers/$ALBUM - $YEAR.jpg" ]; then
			cp "/home/sebastian/Muzyka/.covers/$ALBUM - $YEAR.jpg" "/home/sebastian/Dokumenty/Conky/okładka/currentcover.jpg"
		else
			cp "/home/sebastian/Dokumenty/Conky/okładka/nocover.jpg" "/home/sebastian/Dokumenty/Conky/okładka/currentcover.jpg"
		fi
	fi
else
	exit 1
fi
