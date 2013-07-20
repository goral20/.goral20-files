#!/bin/bash
# skrypt do robienia kopii folderów i plików  z home (Dokumenty, Pobrane, Wideo, Obrazy)

showMenu () {
        echo "1) Wykonaj kopię tylko plików i folderów z Moje Dokumenty"
        echo "2) Wykonaj kopię tylko plików i folderów z Pobrane"
        echo "3) Wykonaj kopię tylko plików i folderów z Wideo"
        echo "4) Wykonaj kopię tylko plików i folderów z Obrazy"
        echo "5) Wykonaj kopię tylko plików i folderów ze wszystkich powyżej"
        echo "6) Wyjście"
        echo -n "Wybierz jedną z opcji od 1..4 do 6 !! Opcja "
}

while [ 1 ]
        do
        showMenu
        read CHOICE
        case "$CHOICE" in
                "1")
                        d="/media/Dane/Backup/Domowe"
                        echo -e
                        echo "Wybrałeś: Wykonaj kopię tylko plików i folderów z Moje Dokumenty"
                        echo "Ostatnia kopia Dokumentów została zrobiona: "$(stat "$d/Moje Dokumenty" | grep Mod | cut -c 13-40 )""
                        echo -e
                        rsync -avz --delete ~/Dokumenty/ "$d/Moje Dokumenty"
                        echo "Kopia/synchronizacja Dokumentów zrobiona"
                        echo -e
                        ;;
                "2")
                        echo -e
                        echo "Wybrałeś: Wykonaj kopię tylko plików i folderów z Pobrane"
                        echo "Ostatnia kopia Pobranych została zrobiona: $(stat "$d/Pobrane" | grep Mod | cut -c 13-40 )"
                        echo -e
                        rsync -avz --delete ~/Pobrane/ "$d/Pobrane"
                        echo "Kopia/synchronizacja Pobranych zrobiona"
                        echo -e
                        ;;
                "3")
                        echo -e
                        echo "Wybrałeś: Wykonaj kopię tylko plików i folderów z Wideo"
                        echo "Ostatnia kopia Wideo została zrobiona: $(stat "$d/Wideo" | grep Mod | cut -c 13-40 )"
                        echo -e
                        rsync -avz --delete ~/Wideo/ "$d/Wideo"
                        echo "Kopia/synchronizacja Wideo zrobiona"
                        echo -e
                        ;;
                "4")
                        echo -e
                        echo "Wybrałeś: Wykonaj kopię tylko plików i folderów z Obrazy"
                        echo "Ostatnia kopia Obrazów została zrobiona: $(stat "$d/Obrazy" | grep Mod | cut -c 13-40 )"
                        echo -e
                        rsync -avz --delete ~/Obrazy/ "$d/Obrazy"
                        echo "Kopia/synchronizacja Obrazów zrobiona"
                        echo -e
                        ;;
                "5")
                        echo "Wybrałeś: Wykonaj kopię tylko plików i folderów ze wszystkich powyżej"
                        echo "Ostatnia kopia Dokument została zrobiona: $(stat "/media/Dane/Backup/Domowe/Moje Dokumenty" | grep Mod | cut -c 13-40 )"
                        rsync -avz --delete -e ~/Dokumenty/* '/media/Dane/Backup/Domowe/Moje Dokumenty'
                        ;;
                "6")
                        echo "Wybrałeś: Wyjście"
                        exit
                        ;;
        esac
done
