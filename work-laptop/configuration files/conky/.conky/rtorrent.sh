#!/bin/sh
test -S "$2" &&
"$@" d.multicall default \
   d.get_name= \
   d.get_up_rate= \
   d.get_down_rate= \
   d.get_completed_chunks= \
   d.get_size_chunks= \
   d.get_ratio=\
   d.is_active= \
|
xmlstarlet sel -t -v / |
awk '/./ {
   if (++i%7 == 1) name=$0
   else if (i%7 == 2) up[name]=$0
   else if (i%7 == 3) down[name]=$0
   else if (i%7 == 4) done[name]=$0
   else if (i%7 == 5) size[name]=$0
   else if (i%7 == 6) ratio[name]=$0
   else if (i%7 == 0) active[name]=$0
} END {
   for(name in active) {
      if(active[name]) {
         up_sum += up[name]
         down_sum += down[name]
         if(++j<=4)
         {
            printf("%.35s\n", name)
            printf(" Postęp: %d%%", 100 * done[name] / size[name])
            printf("                Dw: %.1f kB/s\n", down[name] / 1024)
	    printf(" Ratio: %.3f", ratio[name] / 1000)
            printf("               Up: %.1f kB/s\n", up[name] / 1024)
            printf("\n")
            #printf("$hr\n")
            #printf("\n\b")
         }
      }
   }
}' |
xargs -d'\b' -n1 printf '%s\0' |
sort -z |
xargs -0 -n1 printf '%s'
