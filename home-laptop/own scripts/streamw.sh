 #!/bin/bash
showMenu () {
         echo "1) Ogladaj stream Wonzia w jakości 240p z gamecreads"
         echo "2) Ogladaj stream Wonzia w jakości 380p z gamecreads"
         echo "3) Ogladaj stream Wonzia w jakości 480p z gamecreads "
         echo "4) Ogladaj stream Wonzia w jakości 720p z gamecreads"
         echo "5) Wyjście"
         echo -n "Wybierz jedną z opcji od 1..4 do 5 !! Opcja: "
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
                     while [ $n -le 10 ]
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
                     while [ $n -le 10 ]
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
                     while [ $n -le 10 ]
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
                     while [ $n -le 10 ]
                      do
                      livestreamer -p mplayer http://www.dailymotion.com/embed/video/xzlc83 720p
                      n=$[n + 1]
                     done
                     continue
                    ;;
                "5")
                        echo -e
                        echo "Wybrałeś: Wyjście"
                        exit
                        ;;
        esac
done

