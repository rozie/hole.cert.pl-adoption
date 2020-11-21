#!/usr/bin/env bash

# Usage: provide DNS servers as arguments

if [ $# -lt 1 ]; then
  echo "Usage: ./hole_cert_check server [server2]"
fi

function choose_domain()
{
  domains=`curl -s https://hole.cert.pl/domains/domains.csv | sort -n | tail -n 10 | awk '{print $2}'`
  for line in $domains; do
    res=`host $line`
    state=$?
    if [ ${state} -eq 0 ]; then
      DOMAIN=$line
      return
    fi
  done
}

choose_domain

#DOMAIN="olx.pl-oferta.com"
NON_BLOCK_DNS="8.8.8.8"
TIMESTAMP=`date -u +%Y-%m-%d\ %H:%m:%S`

pattern=`host $DOMAIN $NON_BLOCK_DNS | grep "has address" | sort`

for server in "$@"
do
  result=`host $DOMAIN $server | grep "has address" | sort`
  if [[ $result == $pattern ]]; then
    are_same=1
  else
    are_same=0
  fi
  line=$TIMESTAMP", "$DOMAIN", "$server", "$NON_BLOCK_DNS", "$are_same", "$pattern"; "$result
  echo $line
done
