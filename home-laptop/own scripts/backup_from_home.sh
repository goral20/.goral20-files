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
                        echo "Wybrałeś: Wykonaj kopię tylko plików i folderów z Moje Dokumenty"
                        rsync -avz --delete -e ~/Dokumenty/* '/media/Dane/Backup/Domowe/Moje Dokumenty'
                        echo "Kopia/synchronizacja Dokumentów zrobiona"
                        ;;
                "2")
                        echo "Wybrałeś: Wykonaj kopię tylko plików i folderów z Pobrane"
                        rsync -avz --delete -e ~/Pobrane/* '/media/Dane/Backup/Domowe/Pobrane'
                        echo "Kopia/synchronizacja Pobranych zrobiona"
                        ;;
                "3")
                        echo "Wybrałeś: Wykonaj kopię tylko plików i folderów z Wideo"
                        rsync -avz --delete -e ~/Wideo/* '/media/Dane/Backup/Domowe/Wideo'
                        echo "Kopia/synchronizacja Wideo zrobiona"
                        ;;
                "4")
                        echo "Wybrałeś: Wykonaj kopię tylko plików i folderów z Obrazy"
                        rsync -avz --delete -e ~/Obrazy/* '/media/Dane/Backup/Domowe/Obrazy'
                        echo "Kopia/synchronizacja Obrazów zrobiona"
                        ;;
                "5")
                        echo "Wybrałeś: Wykonaj kopię tylko plików i folderów ze wszystkich powyżej"
                        rsync -avz --delete -e ~/Dokumenty/* '/media/Dane/Backup/Domowe/Moje Dokumenty'
                        ;;
                "6")
                        echo "Wybrałeś: Wyjście"
                        exit
                        ;;
        esac
done
