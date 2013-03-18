#!/bin/bash
sonata info >/home/sebastian/.conky/okładka/textsonata
if [ -f /home/sebastian/.conky/okładka/textsonata ]; then
	YEAR=$(cat /home/sebastian/.conky/okładka/textsonata | grep Data | cut -c 7-)
	ALBUM=$(cat /home/sebastian/.conky/okładka/textsonata | grep Album | cut -c 8-)
	echo "$ALBUM - $YEAR.jpg" > /home/sebastian/.conky/okładka/text1
	IMAGE=$(cat /home/sebastian/.conky/okładka/text1)
	if [ -f "/home/sebastian/Muzyka/.covers/$IMAGE" ]; then
		cp "/home/sebastian/Muzyka/.covers/$IMAGE" "/home/sebastian/.conky/okładka/currentcover.jpg"
	else
		if [ -f "/home/sebastian/Muzyka/.covers/$ALBUM - $YEAR.jpg" ]; then
			cp "/home/sebastian/Muzyka/.covers/$ALBUM - $YEAR.jpg" "/home/sebastian/.conky/okładka/currentcover.jpg"
		else
			cp "/home/sebastian/.conky/okładka/nocover.jpg" "/home/sebastian/.conky/okładka/currentcover.jpg"
		fi
	fi
else
	exit 1
fi
