#!/bin/sh

showMenu () {
        echo "1) Wykonaj kopię plików i folderów"
        echo "2) Rsync"
        echo "3) Wyczyść historię w trybie ..."
        echo "4) Zamontuj ..."
        echo "5) Pod system Archlinux"
        echo "6) Wyjście"
	echo -n "Wybierz jedną z opcji od 1..5 do 6 !! Opcja "
}

while [ 1 ]
do
        showMenu
        read CHOICE
        case "$CHOICE" in
                "1")
                        echo "Wybrałeś: Wykonaj kopię plików i folderów"
			d="/media/Dane/BACKUP/kopia z dnia `date +%Y.%m.%d`"
			mkdir -p "$d"
			cd "$d"
			7z a -t7z -mmt=2 -mx9 "kopia z dnia `date +%Y.%m.%d`".7z ~/.mpd ~/.mpdscribble ~/.ncmpcpp ~/.opera ~/.ssh ~/.mc ~/.conky ~/.conkyrc* ~/.ekg2 ~/Dokumenty ~/.skrypty ~/.fluxbox ~/.mplayer ~/.truecrypt /etc/cron.hourly/ ~/.irssi ~/.zcompdump ~/.zshrc ~/.histfile  ~/.Xdefaults ~/.xinitrc ~/.fehbg ~/.tmux.conf /etc/fstab /etc/network.d/wifi_dom /etc/wpa_supplicant.conf -psebastian123
			md5sum "kopia z dnia `date +%Y.%m.%d`".7z > "kopia z dnia `date +%Y.%m.%d`".7z.md5
			cfv -C -q -VV "kopia z dnia `date +%Y.%m.%d`".7z
			chmod -w *.*
			
			echo "Czy chcesz wysłać zrobioną kopię na serwer?"
			showMenu () {
		        echo "1) Tak"
		        echo "2) Nie i Wyjdź"
			echo -n "Wybierz jedną z opcji 1 lub  2 !! Opcja "
			}

			while [ 1 ]
			do
		        showMenu
		        read CHOICE
		        case "$CHOICE" in
				 "1")
					echo "Wybrałeś: Tak"
					cp -r "$d" "/media/Serwer/Backup"
					echo "Wysyłanie kopii zakończone "

					;;

				 "2")
					echo "Wybrałeś: Nie i Wyjdź"
					exit
			
		esac
		done
		;;

                "2")
			echo "Wybrałeś: Rsync"

			showMenu () {
		        echo "1) Skopiuj Albumy laptop->serwer"
		        echo "2) Skopiuj Soundtracki laptop->serwer"
		        echo "3) Skopiuj Utwory Trance laptop->serwer"
		        echo "4) Skopiuj całą Muzykę laptop->serwer"
		        echo "5) Zsynchronizuj Albumy laptop->serwer"
			echo "6) Zsynchronizuj Soundtracki laptop->serwer"
			echo "7) Zsynchronizuj Utwory Trance laptop->serwer"
			echo "8) Zsynchronizuj całą Muzykę laptop->serwer"
			echo "9) Pobierz Albumy serwer->laptop"
			echo "10) Pobierz Soundtracki serwer->laptop"
			echo "11) Pobierz Utwory Trance serwer->laptop"
			echo "12) Pobierz całą Muzykę serwer->laptop"
			echo "13) Wyjdź"
			echo -n "Wybierz jedną z opcji od 1...7 do 13 !! Opcja "
			}

			while [ 1 ]
			do
		        showMenu
		        read CHOICE
		        case "$CHOICE" in
				 "1")
					echo "Wybrałeś: Skopiuj Albumy laptop->serwer"
					rsync -avz -e 'ssh -p 10025' "/home/sebastian/Muzyka/Albumy/" zse1@192.168.1.5:Multimedia/Muzyka/Albumy
					echo "Kopiowanie zakończone"					
					;;

				 "2")
					echo "Wybrałeś: Skopiuj Soundtracki laptop->serwer"
					rsync -avz -e 'ssh -p 10025' "/home/sebastian/Muzyka/Soundtracki/" zse1@192.168.1.5:Multimedia/Muzyka/Soundtracki
					echo "Kopiowanie zakończone"
					;;

				 "3")
					echo "Wybrałeś: Skopiuj Utwory Trance laptop->serwer"
					rsync -avz -e 'ssh -p 10025' "/home/sebastian/Muzyka/Utwory Trance/" 'zse1@192.168.1.5:Multimedia/Muzyka/Utwory\ Trance'
					echo "Kopiowanie zakończone"
					;;

				 "4")
					echo "Wybrałeś: Skopiuj całą Muzykę laptop->serwer"
					rsync -avz -e 'ssh -p 10025' "/home/sebastian/Muzyka/" zse1@192.168.1.5:Multimedia/Muzyka/
					echo "Kopiowanie zakończone"
					;;

				 "5")
					echo "Wybrałeś: Zsynchronizuj Albumy laptop->serwer"
					rsync -avz --delete -e 'ssh -p 10025' "/home/sebastian/Muzyka/Albumy/" zse1@192.168.1.5:Multimedia/Muzyka/Albumy
					echo "Synchronizacja zakończona"
					;;

				 "6")
					echo "Wybrałeś: Zsynchronizuj Soundtracki laptop->serwer"
					rsync -avz --delete -e 'ssh -p 10025' "/home/sebastian/Muzyka/Soundtracki/" zse1@192.168.1.5:Multimedia/Muzyka/Soundtracki
					echo "Synchronizacja zakończona"
					;;

				 "7")
					echo "Wybrałeś: Zsynchronizuj Utwory Trance laptop->serwer"
					rsync -avz --delete -e 'ssh -p 10025 -i /home/sebastian/.ssh/id_rsa_serwer_dom' "/home/sebastian/Muzyka/Utwory Trance/" "zse1@192.168.1.5:Multimedia/Muzyka/Utwory\ Trance"
					echo "Synchronizacja zakończona"
					;;

				 "8")
					echo "Wybrałeś: Zsynchronizuj całą Muzykę laptop->serwer"
					rsync -avz "/home/sebastian/Muzyka/" zse1@192.168.1.5:Multimedia/Muzyka/
					echo "Synchronizacja zakończona"
					;;

				 "9")
					echo "Wybrałeś: Pobierz Albumy serwer->laptop"
					rsync -avz -e 'ssh -p 10025' zse1@192.168.1.5:Multimedia/Muzyka/Albumy "/home/sebastian/Muzyka/Albumy/" 
					echo "Pobieranie zakończone"
					;;

				 "10")
					echo "Wybrałeś: Pobierz Soundtracki serwer->laptop"
					rsync -avz -e 'ssh -p 10025' zse1@192.168.1.5:Multimedia/Muzyka/Soundtracki "/home/sebastian/Muzyka/Soundtracki/"
					echo "Pobieranie zakończone"
					;;

				 "11")
					echo "Wybrałeś: Pobierz Utwory Trance serwer->laptop"
					rsync -avz -e 'ssh -p 10025' 'zse1@192.168.1.5:Multimedia/Muzyka/Utwory\ Trance' "/home/sebastian/Muzyka/Utwory Trance/"
					echo "Pobieranie zakończone"
					;;

				 "12")
					echo "Wybrałeś: Pobierz całą Muzykę serwer->laptop"
					rsync -avz -e 'ssh -p 10025' zse1@192.168.1.5:Multimedia/Muzyka/ "/home/sebastian/Muzyka/"
					echo "Pobieranie zakończone"
					;;

				 "13")
					echo "Wybrałeś: Wyjście"
					exit
		esac
		done
		;;

                "3")
			echo "Wybrałeś: Wyczyść historię w trybie ..."
		
                	showMenu () {
		        echo "1) Wyczyść całą historię w trybie Zwykłym (niebezpieczny)"
		        echo "2) Wyczyść całą historię w trybie Średnim (szybki)"
		        echo "3) Wyczyść całą historię w trybie Wysokim (wolny)"
		        echo "4) Wyczyść całą historię w trybie Ultra (Shred + Wipe)"
		        echo "5) Usuń bezpiecznie torrenty z Pobranych (Wipe)"
			echo "6) Usuń bezpiecznie torrenty z Pobranych (Shred)"
			echo "7) Opróżnij Bezpieczny_Kosz"
			echo "8) Wyjdź"
			echo -n "Wybierz jedną z opcji od 1...3 do 8 !! Opcja "
			}

			while [ 1 ]
			do
		        showMenu
		        read CHOICE
		        case "$CHOICE" in
				 "1")
					echo "Wybrałeś: Wyczyść całą historię w trybie Zwykłym (niebezpieczny)"
					rm -rf /media/Dane/.Trash-1000/files/* /media/Dane/.Trash-1000/info/* /media/Dane/Multimedia/.Trash-1000/files/* /media/Dane/Multimedia/.Trash-1000/info/* /media/Dane/Multimedia/Anime/.Trash-1000/files/* /media/Dane/Multimedia/Anime/.Trash-1000/info/* /media/Dane/Multimedia/Filmy/.Trash-1000/files/* /media/Dane/Multimedia/Filmy/.Trash-1000/info/* /media/Dane/Multimedia/Seriale/.Trash-1000/files/* /media/Dane/Multimedia/Seriale/.Trash-1000/info/* /media/Dane/Multimedia/Teledyski/.Trash-1000/files/* /media/Dane/Multimedia/Teledyski/.Trash-1000/info/* /home/sebastian/Obrazy/.Trash-1000/files/* /home/sebastian/Obrazy/.Trash-1000/info* ~/Dokumenty/.Trash-1000/files ~/Dokumenty/.Trash-1000/info ~/Pobrane/.Trash-1000/files/* ~/Pobrane/.Trash-1000/info/* /media/Goral/.Trash-1000/files/* $HOME/.local/share/Trash/files/*  $HOME/.local/share/Trash/info/* ~/Pobrane/*.torrent ~/Pulpit/*.torrent rm -f  ~/.bash_history && touch ~/.bash_history
					echo "Czyszczenie zakończone"					
					;;

				 "2")
					echo "Wybrałeś: Wyczyść całą historię w trybie Średnim (szybki)"
					wipe -i -r -p3 -e /media/Dane/.Trash-1000/files/* -l1 -f
					wipe -i -r -p3 -e /media/Dane/.Trash-1000/info/* -l1 -f
					wipe -i -r -p3 -e /media/Dane/Multimedia/.Trash-1000/files/* -l1 -f
					wipe -i -r -p3 -e /media/Dane/Multimedia/.Trash-1000/info/* -l1 -f
					wipe -i -r -p3 -e /media/Dane/Multimedia/Anime/.Trash-1000/files/* -l1 -f
					wipe -i -r -p3 -e /media/Dane/Multimedia/Anime/.Trash-1000/info/* -l1 -f
					wipe -i -r -p3 -e /media/Dane/Multimedia/Filmy/.Trash-1000/files/* -l1 -f
					wipe -i -r -p3 -e /media/Dane/Multimedia/Filmy/.Trash-1000/info/* -l1 -f
					wipe -i -r -p3 -e /media/Dane/Multimedia/Seriale/.Trash-1000/files/* -l1 -f
					wipe -i -r -p3 -e /media/Dane/Multimedia/Seriale/.Trash-1000/info/* -l1 -f
					wipe -i -r -p3 -e /media/Dane/Multimedia/Teledyski/.Trash-1000/files/* -l1 -f
					wipe -i -r -p3 -e /media/Dane/Multimedia/Teledyski/.Trash-1000/info/* -l1 -f
					wipe -i -r -p3 -e ~/Dokumenty/.Trash-1000/files -l1 -f
					wipe -i -r -p3 -e ~/Dokumenty/.Trash-1000/info -l1 -f
					wipe -i -r -p3 -e ~/Obrazy/.Trash-1000/files/* -l1 -f
					wipe -i -r -p3 -e ~/Obrazy/.Trash-1000/info* -l1 -f
					wipe -i -r -p3 -e ~/Pobrane/.Trash-1000/files/* -l1 -f
					wipe -i -r -p3 -e ~/Pobrane/.Trash-1000/info/* -l1 -f
					wipe -i -r -p3 -e /media/Goral/.Trash-1000/files/* -l1 -f
					wipe -i -r -p3 -e $HOME/.local/share/Trash/files/* -l1 -f
					wipe -i -r -p3 -e $HOME/.local/share/Trash/info/* -l1 -f
					wipe -i -r -p3 -e ~/Pobrane/*.torrent -l1 -f
					wipe -i -r -p3 -e ~/Pulpit/*.torrent -l1 -f
					wipe -i -r -p3 -e ~/.bash_history -l1 -f && touch ~/.bash_history
					echo "Czyszczenie zakończone"
					;;

				 "3")
					echo "Wybrałeś: Wyczyść całą historię w trybie Wysokim (wolny)"
					wipe -i -r -p20 -e /media/Dane/.Trash-1000/files/* -l2 -f
					wipe -i -r -p20 -e /media/Dane/.Trash-1000/info/* -l2 -f
					wipe -i -r -p20 -e /media/Dane/Multimedia/.Trash-1000/files/* -l2 -f
					wipe -i -r -p20 -e /media/Dane/Multimedia/.Trash-1000/info/* -l2 -f
					wipe -i -r -p20 -e /media/Dane/Multimedia/Anime/.Trash-1000/files/* -l2 -f
					wipe -i -r -p20 -e /media/Dane/Multimedia/Anime/.Trash-1000/info/* -l2 -f
					wipe -i -r -p20 -e /media/Dane/Multimedia/Filmy/.Trash-1000/files/* -l2 -f
					wipe -i -r -p20 -e /media/Dane/Multimedia/Filmy/.Trash-1000/info/* -l2 -f
					wipe -i -r -p20 -e /media/Dane/Multimedia/Seriale/.Trash-1000/files/* -l2 -f
					wipe -i -r -p20 -e /media/Dane/Multimedia/Seriale/.Trash-1000/info/* -l2 -f
					wipe -i -r -p20 -e /media/Dane/Multimedia/Teledyski/.Trash-1000/files/* -l2 -f
					wipe -i -r -p20 -e /media/Dane/Multimedia/Teledyski/.Trash-1000/info/* -l2 -f
					wipe -i -r -p20 -e ~/Obrazy/.Trash-1000/files/* -l2 -f
					wipe -i -r -p20 -e ~/Obrazy/.Trash-1000/info* -l2 -f
					wipe -i -r -p20 -e ~/Dokumenty/.Trash-1000/files -l2 -f
					wipe -i -r -p20 -e ~/Dokumenty/.Trash-1000/info -l2 -f
					wipe -i -r -p20 -e ~/Pobrane/.Trash-1000/files/* -l2 -f
					wipe -i -r -p20 -e ~/Pobrane/.Trash-1000/info/* -l2 -f
					wipe -i -r -p20 -e /media/Goral/.Trash-1000/files/* -l2 -f
					wipe -i -r -p20 -e $HOME/.local/share/Trash/files/* -l2 -f
					wipe -i -r -p20 -e $HOME/.local/share/Trash/info/* -l2 -f
					wipe -i -r -p20 -e ~/Pobrane/*.torrent -l2 -f
					wipe -i -r -p20 -e ~/Pulpit/*.torrent -l2 -f
					wipe -i -r -p20 -e ~/.bash_history -l2 -f && touch ~/.bash_historyecho "Czyszczenie zakończone"
					;;

				 "4")
					echo "Wybrałeś: Wyczyść całą historię w trybie Ultra (Shred + Wipe)"
					shred -zuvn 10 /media/Dane/.Trash-1000/files/*
					shred -zuvn 10 /media/Dane/.Trash-1000/info/*
					shred -zuvn 10 /media/Dane/Multimedia/.Trash-1000/files/*
					shred -zuvn 10 /media/Dane/Multimedia/.Trash-1000/info/*
					shred -zuvn 10 /media/Dane/Multimedia/Anime/.Trash-1000/files/*
					shred -zuvn 10 /media/Dane/Multimedia/Anime/.Trash-1000/info/*
					shred -zuvn 10 /media/Dane/Multimedia/Filmy/.Trash-1000/files/*
					shred -zuvn 10 /media/Dane/Multimedia/Filmy/.Trash-1000/info/*
					shred -zuvn 10 /media/Dane/Multimedia/Seriale/.Trash-1000/files/*
					shred -zuvn 10 /media/Dane/Multimedia/Seriale/.Trash-1000/info/*
					shred -zuvn 10 /media/Dane/Multimedia/Teledyski/.Trash-1000/files/*
					shred -zuvn 10 /media/Dane/Multimedia/Teledyski/.Trash-1000/info/*
					shred -zuvn 10 ~/Obrazy/.Trash-1000/files/*
					shred -zuvn 10 ~/Obrazy/.Trash-1000/info*
					shred -zuvn 10 ~/Dokumenty/.Trash-1000/files/*
					shred -zuvn 10 ~/Dokumenty/.Trash-1000/info/*
					shred -zuvn 10 ~/Pobrane/.Trash-1000/files/*
					shred -zuvn 10 ~/Pobrane/.Trash-1000/info/*
					shred -zuvn 10 /media/Goral/.Trash-1000/files/*
					shred -zuvn 10 $HOME/.local/share/Trash/files/*
					shred -zuvn 10 $HOME/.local/share/Trash/info/*
					shred -zuvn 10 ~/Pobrane/*.torrent
					shred -zuvn 10 ~/Pulpit/*.torrent
					find /media/Dane/BEZPIECZNY_KOSZ -iname "*" -exec shred {} -z -u -v -n 10 \;;wipe -irp 20 -e /media/Dane/BEZPIECZNY_KOSZ/* -l2 -f
					shred -zuvn 10 ~/.bash_history -l1 -f && touch ~/.bash_history
					echo "Czyszczenie zakończone"
					;;

				 "5")
					echo "Wybrałeś: Usuń bezpiecznie torrenty z Pobranych (Wipe)"
					wipe -i -r -p20 -e ~/Pobrane/*.torrent -l2 -f
					echo "Czyszczenie zakończone"
					;;

				 "6")
					echo "Wybrałeś: Usuń bezpiecznie torrenty z Pobranych (Shred)"
					shred -zuvn 10 ~/Pobrane/*.torrent
					echo "Czyszczenie zakończone"
					;;

				 "7")
					echo "Wybrałeś: Opróżnij Bezpieczny_Kosz"
					find /media/Dane/BEZPIECZNY_KOSZ -iname "*" -exec shred {} -z -u -v -n 10 \;;wipe -irp 20 -e /media/Dane/BEZPIECZNY_KOSZ/* -l2 -f
					echo "Czyszczenie zakończone"
					;;

				 "8")
					echo "Wybrałeś: Wyjście"
					exit
		esac
		done
		;;

		"4")
			echo "Wybrałeś: Zamontuj ..."
			;;
                "5")
			echo "Wybrałeś: Pod system Archlinux"
			
			showMenu () {
		        echo "1) Aktualizacja systemu"
		        echo "2) Czyszczenie pakietów"
		        echo "3) Wyjdź"
			echo -n "Wybierz jedną z opcji od 1...2 do 3 !! Opcja "
			}

			while [ 1 ]
			do
		        showMenu
		        read CHOICE
		        case "$CHOICE" in
				 "1")
					echo "Wybrałeś: Aktualizacja systemu"
					sudo pacman -Syu
					echo "Aktualizacja zakończona"					
					;;

				 "2")
					echo "Wybrałeś: Czyszczenie pakietów"
					sudo pacman -Scc
					echo "Czyszczenie pakietów zakończone"
					;;

				 "3")
					echo "Wybrałeś: Wyjście"
					exit
		esac
		done
		;;
			
		"6")
			echo "Wybrałeś: Wyjście"
			exit
			;;
        esac
done
