#!/bin/bash

#set logfile variable based on passed arguement
logfile="$1"

#get top 5 ips with request counts
requests=$(awk '{print $1}' $logfile | sort -k1 | uniq -c |sort -rk1 | head -n 5 | awk '{print $1}')
ips=$(awk '{print $1}' $logfile | sort -k1 | uniq -c |sort -rk1 | head -n 5 | awk '{print $2}')

#convert strings to arrays
requests=( ${requests// / } )
ips=( ${ips// / } )

echo "Top 5 IP addresses with the most requests:"

for i in {0..4}; do
    if [ -z ${ips[i]} ]; then
        continue
    fi
    echo "${ips[i]} - ${requests[i]} requests"
done

#get top 5 paths with request counts
requests=$(awk '{print $7}' $logfile | sort -k1 | uniq -c |sort -rk1 | head -n 5 | awk '{print $1}')
paths=$(awk '{print $7}' $logfile | sort -k1 | uniq -c |sort -rk1 | head -n 5 | awk '{print $2}')

#convert strings to arrays
requests=( ${requests// / } )
paths=( ${paths// / } )

echo -e "\nTop 5 most requested paths:"

for i in {0..4}; do
    if [ -z ${paths[i]} ]; then
        continue
    fi
    echo "${paths[i]} - ${requests[i]} requests"
done

#get top 5 response status codes with request counts
requests=$(awk '{print $9}' $logfile | sort -k1 | uniq -c |sort -rk1 | head -n 5 | awk '{print $1}')
codes=$(awk '{print $9}' $logfile | sort -k1 | uniq -c |sort -rk1 | head -n 5 | awk '{print $2}')

#convert strings to arrays
requests=( ${requests// / } )
codes=( ${codes// / } )

echo -e "\nTop 5 response status codes:"

for i in {0..4}; do
    if [ -z ${codes[i]} ]; then
        continue
    fi
    echo "${codes[i]} - ${requests[i]} requests"
done

#get top 5 users with request counts
requests=$(awk '{print $12}' $logfile | sort -k1 | uniq -c |sort -rk1 | head -n 5 | awk '{print $1}')
users=$(awk '{print $12}' $logfile | sort -k1 | uniq -c |sort -rk1 | head -n 5 | awk '{print $2}')

#convert strings to arrays
requests=( ${requests// / } )
users=( ${users// / } )

echo -e "\nTop 5 User Agents:"

for i in {0..4}; do
    if [ -z ${users[i]} ]; then
        continue
    fi
    echo "${users[i]} - ${requests[i]} requests"
done
