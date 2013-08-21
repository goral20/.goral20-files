#!/bin/bash
        echo -e "\\033[1;31mSkrypt do oglądania streamów wonzia z gamecreads oraz twitch\\033[0m"
        echo "Podaj liczbę powtórzeń i wybierz stream z podanych jakości"
        echo "Wpisz liczbę prób: "
        echo "Wpisz 0 aby wyjść"
        read prob
        if [[ $prob -gt 0 ]] ; then
          continue
        else
          exit
        fi
showMenu () {
        echo -e
        echo "1) Ogladaj stream Wonzia w jakości 240p z gamecreads"
        echo "2) Ogladaj stream Wonzia w jakości 380p z gamecreads"
        echo "3) Ogladaj stream Wonzia w jakości 480p z gamecreads"
        echo "4) Ogladaj stream Wonzia w jakości 720p z gamecreads"
        echo "5) Ogladaj stream Wonzia w jakości 240p z twitch"
        echo "6) Ogladaj stream Wonzia w jakości 360p z twitch"
        echo "7) Ogladaj stream Wonzia w jakości 480p z twitch"
        echo "8) Ogladaj stream Wonzia w jakości 720p z twitch"
        echo "9) Ogladaj stream Wonzia w jakości 1080p z twitch"
        echo "Q) Wyjście"

        echo -n "Opcja streamu: "
}

while [ 1 ]
        do
        showMenu
        read CHOICE
        case "$CHOICE" in
                "1")
                     echo -e
                     echo "Wybrałeś: Ogladaj stream Wonzia w jakości 240p z gamecreads"
                     n=1;
                     while [ $n -lt "$prob" ]
                      do
                      livestreamer -p mplayer http://www.dailymotion.com/embed/video/xzlc83 240p
                      n=$[n + 1]
                     done
                     continue
                    ;;
                "2")
                     echo -e
                     echo "Wybrałeś: Ogladaj stream Wonzia w jakości 380p z gamecreads"
                     n=1;
                     while [ $n -lt "$prob" ]
                      do
                      livestreamer -p mplayer http://www.dailymotion.com/embed/video/xzlc83 380p
                      n=$[n + 1]
                     done
                     continue
                    ;;
                "3")
                     echo -e
                     echo "Wybrałeś: Ogladaj stream Wonzia w jakości 480p z gamecreads"
                     n=1;
                     while [ $n -lt "$prob" ]
                      do
                      livestreamer -p mplayer http://www.dailymotion.com/embed/video/xzlc83 480p
                      n=$[n + 1]
                     done
                     continue
                    ;;
                "4")
                     echo -e
                     echo "Wybrałeś: Ogladaj stream Wonzia w jakości 720p z gamecreads"
                     n=1;
                     while [ $n -lt "$prob" ]
                      do
                      livestreamer -p mplayer http://www.dailymotion.com/embed/video/xzlc83 720p
                      n=$[n + 1]
                     done
                     continue
                     ;;
                "5")
                     echo -e
                     echo "Wybrałeś: Ogladaj stream Wonzia w jakości 240p z twitch"
                     n=1;
                     while [ $n -lt "$prob" ]
                      do
                      livestreamer -p mplayer http://www.twitch.tv/wonziu 240p
                      n=$[n + 1]
                     done
                     continue
                     ;;
                "6")
                     echo -e
                     echo "Wybrałeś: Ogladaj stream Wonzia w jakości 360p z twitch"
                     n=1;
                     while [ $n -lt "$prob" ]
                      do
                      livestreamer -p mplayer http://www.twitch.tv/wonziu 360p
                      n=$[n + 1]
                     done
                     continue
                     ;;
                "7")
                     echo -e
                     echo "Wybrałeś: Ogladaj stream Wonzia w jakości 480p z twitch"
                     n=1;
                     while [ $n -lt "$prob" ]
                      do
                      livestreamer -p mplayer http://www.twitch.tv/wonziu 480p
                      n=$[n + 1]
                     done
                     continue
                     ;;
                "8")
                     echo -e
                     echo "Wybrałeś: Ogladaj stream Wonzia w jakości 720p z twitch"
                     n=1;
                     while [ $n -lt "$prob" ]
                      do
                      livestreamer -p mplayer http://www.twitch.tv/wonziu 720p
                      n=$[n + 1]
                     done
                     continue
                    ;;
                "9")
                     echo -e
                     echo "Wybrałeś: Ogladaj stream Wonzia w jakości 1080p z twitch"
                     n=1;
                     while [ $n -lt "$prob" ]
                      do
                      livestreamer -p mplayer http://www.twitch.tv/wonziu 1080p
                      n=$[n + 1]
                     done
                     continue
                    ;;
                "Q")
                        echo -e
                        echo "Wybrałeś: Wyjście"
                        exit
                        ;;
        esac
done

