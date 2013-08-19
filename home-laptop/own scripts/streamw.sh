 #!/bin/bash
showMenu () {
         echo "Wybierz jedna z 4 opcji i podaj liczbę powtórzeń"
         echo "1) Ogladaj stream Wonzia w jakości 240p z gamecreads"
         echo "2) Ogladaj stream Wonzia w jakości 380p z gamecreads"
         echo "3) Ogladaj stream Wonzia w jakości 480p z gamecreads"
         echo "4) Ogladaj stream Wonzia w jakości 720p z gamecreads"
         echo "5) Wyjście"
         echo "Wpisz liczbę prób: "
         echo "Wpisz 0 aby wyjść"
                  read prob
                  echo -e
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
                     while [ $n -eq "$prob" ]
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
                     while [ $n -eq "$prob" ]
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
                     while [ $n -eq "$prob" ]
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
                     while [ $n -eq "$prob" ]
                      do
                      livestreamer -p mplayer http://www.dailymotion.com/embed/video/xzlc83 720p
                      n=$[n + 1]
                     done
                     continue
                    ;;
                "6")
                        echo -e
                        echo "Wybrałeś: Wyjście"
                        exit
                        ;;
        esac
done

