# Skrypt przerabiający napisy z ass na srt
# konwertowanie poleceniem ./script-ass-to-srt.sh < my-ass.ass >> my-srt.srt
grep Dialogue | \
awk -F, 'BEGIN { TELLER="1"; }
         { printf("%s\n0%s,%s0 --> 0%s,%s0\n",
                       TELLER,substr($2,0,7),substr($2,9,2),substr($3,0,7),substr($3,9,2));
           TELLER++;}
         { DIALOGUE=$10;
           for(i=11;i<=NF;i++)
           {
               DIALOGUE=DIALOGUE","$i
           };
           printf ("%s\n\n",DIALOGUE)}'
